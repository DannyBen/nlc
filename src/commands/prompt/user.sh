if [[ "${args[--clear]}" ]]; then
  printf "rm %s\n" "$(green "$USER_PROMPT_FILE")"
  rm -f "$USER_PROMPT_FILE"
fi

if [[ "${args[--edit]}" ]]; then
  printf "%s %s\n" "$EDITOR" "$(green "$USER_PROMPT_FILE")"
  "$EDITOR" "$USER_PROMPT_FILE"
else
  prompt_user
fi