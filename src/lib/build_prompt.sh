build_prompt() {
  local system_prompt

  system_prompt=$'You are a command-line generator.
    Return ONLY an executable bash command or sequence of commands.
    NO backticks. NO explanations. NO comments.
    Prefer widely-available tools.
    Prefer common, user-facing commands over specialized or terse variants.
    Prefer short commands, do NOT overengineer.
    Default to safe, non-destructive options unless explicitly requested otherwise.
    Quote/escape filenames or arguments when necessary.
    If the request is ambiguous, choose sensible defaults rather than asking questions.
    Output must be valid for /bin/bash -lc (newlines, pipes, redirection are fine).
  '

  if [[ -f "$prompt_file" ]]; then
    system_prompt+=$'\n'
    system_prompt+="$(cat "$prompt_file")"
  fi

  printf '%s' "$system_prompt"
}
