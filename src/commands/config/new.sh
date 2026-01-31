force="${args[--force]}"
if [[ -f "$CONFIG_FILE" && -z "$force" ]]; then
  printf "config file already exists: %s\n" "$(green "$CONFIG_FILE")"
  printf "run with %s to overwrite\n" "$(magenta --force)"
  return 2
fi

printf "defaults > %s\n" "$(green "$CONFIG_FILE")"
config_create_defaults
