#!/usr/bin/env bash
set -u

VERSION="0.1.1"

# ---- Config ----
NLC_PROVIDER="${NLC_PROVIDER:-openai}"
case "$NLC_PROVIDER" in
  groq) NLC_MODEL="${NLC_MODEL:-llama-3.3-70b-versatile}" ;;
  openai) NLC_MODEL="${NLC_MODEL:-gpt-4.1-mini}" ;;
  *) NLC_MODEL="${NLC_MODEL:-llama-3.3-70b-versatile}" ;;
esac

# ANSI colors for prompt/status
BOLD=$'\033[1m'
GREEN=$'\033[32m'
BLUE=$'\033[34m'
RESET=$'\033[0m'
CLRLINE=$'\033[2K'
CR=$'\r'

# System prompt template
read -r -d '' SYSTEM_PROMPT <<'EOF'
You are a command-line generator.
Return ONLY an executable bash command or sequence of commands.
NO backticks. NO explanations. NO comments.
Prefer widely-available tools.
Default to safe, non-destructive options unless explicitly requested otherwise.
Quote/escape filenames or arguments when necessary.
If the request is ambiguous, choose sensible defaults rather than asking questions.
Output must be valid for /bin/bash -lc (newlines, pipes, redirection are fine).
EOF

fail() {
  echo "Error: $1" >&2
  exit "${2:-2}"
}

strip_code_fences() {
  # Trim and remove markdown fences/backticks
  local s="$1"
  s="$(printf '%s' "$s" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
  if [[ "$s" == '```'* ]]; then
    s="$(printf '%s\n' "$s" | sed '1{/^```/d;}; ${/^```/d;}')"
  fi
  s="$(printf '%s' "$s" | sed -e 's/^`*//' -e 's/`*$//')"
  printf '%s' "$s"
}

print_usage() {
  # CLI help
  cat <<'EOF'
nlc (Natural Language → Command)

Usage:
    nlc MESSAGE...
    nlc --version
    nlc -v

Examples:
    nlc convert input.webm to output.mp4 using the best standards and ffmpeg
    nlc list all docker images older than a month and delete them

Environment Variables:
    OPENAI_API_KEY  Your OpenAI API key
    GROQ_API_KEY    Your Groq API key
    NLC_PROVIDER    The provider to use (openai or groq)
    NLC_MODEL       The model to use (default depending on provider)
EOF
  exit 1
}

check_deps() {
  # External tools required
  command -v curl >/dev/null 2>&1 || fail "curl not found"
  command -v jq >/dev/null 2>&1 || fail "jq not found"
}

initialize_client() {
  # Validate keys and choose API base
  local api_key="${OPENAI_API_KEY:-}"
  local groq_key="${GROQ_API_KEY:-}"

  if [[ "$NLC_PROVIDER" == "openai" && -z "$api_key" ]]; then
    fail "OPENAI_API_KEY not set"
  fi
  if [[ "$NLC_PROVIDER" == "groq" && -z "$groq_key" ]]; then
    fail "GROQ_API_KEY not set"
  fi

  case "$NLC_PROVIDER" in
    openai) API_BASE="https://api.openai.com/v1" ;;
    groq) API_BASE="https://api.groq.com/openai/v1" ;;
    *) fail "Unsupported provider. Use 'openai' or 'groq'." ;;
  esac
}

build_payload() {
  # Build OpenAI-compatible chat payload
  local user_request="$1"
  jq -n \
    --arg model "$NLC_MODEL" \
    --arg system "$SYSTEM_PROMPT" \
    --arg user "$user_request" \
    '{
      model: $model,
      messages: [
        {role: "system", content: $system},
        {role: "user", content: $user}
      ],
      temperature: 0,
      max_tokens: 512
    }'
}

process_request() {
  # Call API and extract model output
  local user_request="$1"
  local auth_header
  local api_key
  local payload
  local response
  local content

  if [[ "$NLC_PROVIDER" == "openai" ]]; then
    api_key="$OPENAI_API_KEY"
  else
    api_key="$GROQ_API_KEY"
  fi
  auth_header="Authorization: Bearer $api_key"
  payload="$(build_payload "$user_request")"

  response="$(curl -sS "$API_BASE/chat/completions" \
    -H "Content-Type: application/json" \
    -H "$auth_header" \
    -d "$payload")" || {
      echo "${CR}${CLRLINE}Error contacting ${NLC_PROVIDER}" >&2
      exit 2
    }

  if jq -e '.error' >/dev/null 2>&1 <<<"$response"; then
    local err
    err="$(jq -r '.error.message // "Unknown error"' <<<"$response")"
    echo "${CR}${CLRLINE}Error contacting ${NLC_PROVIDER}: ${err}" >&2
    exit 2
  fi

  content="$(jq -r '.choices[0].message.content // ""' <<<"$response")"
  strip_code_fences "$content"
}

execute_command() {
  # Show command and optionally execute
  local cmd="$1"
  if [[ -z "$cmd" ]]; then
    echo "${CR}${CLRLINE}Error: Model returned empty output" >&2
    exit 2
  fi

  printf "%s%s$ %s%s%s " "$CR" "$CLRLINE" "$BLUE" "$BOLD$GREEN$cmd$RESET" ""

  local choice=""
  if ! IFS= read -r choice; then
    echo ""
  fi

  echo ""

  if [[ -z "$choice" ]]; then
    /bin/bash -lc "$cmd"
    exit $?
  else
    echo "Cancelled."
    exit 0
  fi
}

main() {
  # Parse args and run pipeline
  if [[ $# -lt 1 ]]; then
    print_usage
  fi

  if [[ "$1" == "--version" || "$1" == "-v" ]]; then
    echo "nlc version $VERSION"
    exit 0
  fi

  check_deps
  initialize_client

  # Build request text
  local user_request
  user_request="$*"

  # Generate and run command
  printf "\n%s$ %s..." "$BLUE" "$RESET"
  local cmd
  cmd="$(process_request "$user_request")"
  execute_command "$cmd"
}

main "$@"
