bold_underlined "Environment"
printf "  %-28s: %s\n" "$(green NLC_CONFIG)" "$NLC_CONFIG"
printf "  %-28s: %s\n" "$(green OPENAI_API_KEY)" "$(truncate_mid "$OPENAI_API_KEY")"
printf "  %-28s: %s\n" "$(green GROQ_API_KEY)" "$(truncate_mid "$GROQ_API_KEY")"
echo

bold_underlined "Internal Truth"
printf "  %-28s: %s\n" "$(green CONFIG_FILE)" "$CONFIG_FILE"
printf "  %-28s: %s\n" "$(green PROVIDER)" "$PROVIDER"
printf "  %-28s: %s\n" "$(green MODEL)" "$MODEL"
printf "  %-28s: %s\n" "$(green API_BASE)" "$API_BASE"
printf "  %-28s: %s\n" "$(green API_KEY)" "$(truncate_mid "$API_KEY")"
printf "  %-28s: %s\n" "$(green USER_PROMPT_FILE)" "$USER_PROMPT_FILE"
printf "  %-28s: %s\n" "$(green SYSTEM_PROMPT_FILE)" "$SYSTEM_PROMPT_FILE"
echo

bold_underlined "Prompts"
printf "  %-28s: %s\n" "$(green system_prompt)" "$(truncate_mid "$(prompt_system)" 20)"
printf "  %-28s: %s\n" "$(green user_prompt)" "$(truncate_mid "$(prompt_user)" 20)"
echo

bold_underlined "Files"
printf "  %-28s: %s\n" \
  "$(green config file)" \
  "$(if [[ -f "$CONFIG_FILE" ]]; then echo exists; else echo does not exist; fi)"

printf "  %-28s: %s\n" \
  "$(green system prompt file)" \
  "$(if [[ -f "$SYSTEM_PROMPT_FILE" ]]; then echo exists; else echo does not exist; fi)"

printf "  %-28s: %s\n" \
  "$(green user prompt file)" \
  "$(if [[ -f "$USER_PROMPT_FILE" ]]; then echo exists; else echo does not exist; fi)"
