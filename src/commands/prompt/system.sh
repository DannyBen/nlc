if [[ "${args[--clear]}" ]]; then
  printf "rm $(green "$SYSTEM_PROMPT_FILE")\n"
  rm -f "$SYSTEM_PROMPT_FILE"
fi

if [[ "${args[--default]}" ]]; then
  printf "defaults > $(green "$SYSTEM_PROMPT_FILE")\n"
  prompt_system > "$SYSTEM_PROMPT_FILE"
fi

if [[ "${args[--edit]}" ]]; then
  printf "$EDITOR $(green "$SYSTEM_PROMPT_FILE")\n"
  "$EDITOR" "$SYSTEM_PROMPT_FILE"
else
  prompt_system
fi