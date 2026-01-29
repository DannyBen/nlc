## Call API and extract model output
process_request() {
  local user_request="$1"
  local auth_header
  local payload
  local response
  local content

  auth_header="Authorization: Bearer $api_key"
  payload="$(build_payload "$user_request")"

  response="$(curl -sS "$api_base/chat/completions" \
    -H "Content-Type: application/json" \
    -H "$auth_header" \
    -d "$payload")" || {
      printf "\rError contacting ${provider}" >&2
      exit 2
    }

  if jq -e '.error' >/dev/null 2>&1 <<<"$response"; then
    local err
    err="$(jq -r '.error.message // "Unknown error"' <<<"$response")"
    printf "\rError contacting ${provider}: ${err}" >&2
    exit 2
  fi

  content="$(jq -r '.choices[0].message.content // ""' <<<"$response")"
  strip_code_fences "$content"
}
