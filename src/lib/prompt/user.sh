prompt_user() {
  if [[ -f "$USER_PROMPT_FILE" ]]; then
    cat "$USER_PROMPT_FILE"
  fi
}
