if [[ "${args[--clear]}" ]]; then
  printf "rm $(green "$USER_PROMPT_FILE")\n"
  rm -f "$USER_PROMPT_FILE"
fi

if [[ "${args[--edit]}" ]]; then
  printf "$EDITOR $(green "$USER_PROMPT_FILE")\n"
  "$EDITOR" "$USER_PROMPT_FILE"
else
  prompt_user
fi