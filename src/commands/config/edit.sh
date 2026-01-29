if [[ ! -s "$CONFIG_FILE" ]]; then
  printf "defaults > %s\n" "$(green "$CONFIG_FILE")"
  config_create_defaults
fi

printf "%s %s\n" "$EDITOR" "$(green "$CONFIG_FILE")"
"$EDITOR" "$CONFIG_FILE"
