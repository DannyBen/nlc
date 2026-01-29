bold_underlined "Environment"
printf "  %-28s: %s\n" "$(green NLC_CONFIG)" "$NLC_CONFIG"
printf "  %-28s: %s\n" "$(green OPENAI_API_KEY)" "$(truncate_mid "$OPENAI_API_KEY")"
printf "  %-28s: %s\n" "$(green GROQ_API_KEY)" "$(truncate_mid "$GROQ_API_KEY")"
echo

bold_underlined "Internal Truth"
printf "  %-28s: %s\n" "$(green config_file)" "$config_file"
printf "  %-28s: %s\n" "$(green provider)" "$provider"
printf "  %-28s: %s\n" "$(green model)" "$model"
printf "  %-28s: %s\n" "$(green api_base)" "$api_base"
printf "  %-28s: %s\n" "$(green api_key)" "$(truncate_mid "$api_key")"
printf "  %-28s: %s\n" "$(green prompt_file)" "$prompt_file"
printf "  %-28s: %s\n" "$(green system_prompt_file)" "$system_prompt_file"
echo

bold_underlined "Prompts"
printf "  %-28s: %s\n" "$(green system_prompt)" "$(truncate_mid "$(prompt_system)" 20)"
printf "  %-28s: %s\n" "$(green user_prompt)" "$(truncate_mid "$(prompt_user)" 20)"
echo   "  (run $(magenta nlc prompt show) for the full prompt)"

