prompt_system() {
  if [[ -s "$SYSTEM_PROMPT_FILE" ]]; then
    cat "$SYSTEM_PROMPT_FILE"
  else
    prompt_default
  fi
}
