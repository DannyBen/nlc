force="${args[--force]}"
if [[ -f "$CONFIG_FILE" && -z "$force" ]]; then
  echo "Config file already exists: $(green "$CONFIG_FILE")"
  echo "Run with $(magenta --force) to overwrite"
  return 2
fi

printf "defaults > $(green "$CONFIG_FILE")\n"
config_create_defaults
