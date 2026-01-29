## Call API and extract model output
process_request() {
  local user_request="$1"
  local auth_header
  local payload
  local response
  local content

  auth_header="Authorization: Bearer $API_KEY"
  payload="$(build_payload "$user_request")"

  response="$(curl -sS "$API_BASE/chat/completions" \
    -H "Content-Type: application/json" \
    -H "$auth_header" \
    -d "$payload" 2>&1)" || {
    printf "\rcurl error: %s\n" "$response" >&2
    exit 2
  }

  if jq -e '.error' >/dev/null 2>&1 <<<"$response"; then
    local err
    err="$(jq -r '.error.message // "Unknown error"' <<<"$response" 2>&1)"
    printf "\rapi error: %s\n" "${err}" >&2
    exit 2
  fi

  content="$(jq -r '.choices[0].message.content // ""' <<<"$response")"
  strip_code_fences "$content"
}
