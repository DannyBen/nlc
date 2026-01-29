if [[ ! -s "$file" ]]; then
  printf "defaults > $(green "$CONFIG_FILE")\n"
  config_create_defaults
fi

printf "$EDITOR $(green "$CONFIG_FILE")\n"
"$EDITOR" "$CONFIG_FILE"
