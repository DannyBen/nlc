if [[ "${args[--clear]}" ]]; then
  printf "rm %s\n" "$(green "$SYSTEM_PROMPT_FILE")"
  rm -f "$SYSTEM_PROMPT_FILE"
fi

if [[ "${args[--default]}" ]]; then
  printf "defaults > %s\n" "$(green "$SYSTEM_PROMPT_FILE")"
  prompt_system >"$SYSTEM_PROMPT_FILE"
fi

if [[ "${args[--edit]}" ]]; then
  printf "%s %s\n" "$EDITOR" "$(green "$SYSTEM_PROMPT_FILE")"
  "$EDITOR" "$SYSTEM_PROMPT_FILE"
else
  prompt_system
fi