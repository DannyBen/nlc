## Trim and remove markdown fences/backticks
strip_code_fences() {
  local s="$1"
  s="$(printf '%s' "$s" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
  if [[ "$s" == '```'* ]]; then
    s="$(printf '%s\n' "$s" | sed '1{/^```/d;}; ${/^```/d;}')"
  fi
  s="$(printf '%s' "$s" | sed -e 's/^`*//' -e 's/`*$//')"
  printf '%s' "$s"
}
