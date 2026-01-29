config_create_defaults() {
  config_dir="$(dirname -- "$CONFIG_FILE")"
  mkdir -p -- "$config_dir"

  config_set ai.provider openai
  config_set ai.model gpt-4.1-mini
  config_set ai.api_key
  config_set ai.api_base https://api.openai.com/v1
  config_set prompt.system "$HOME/.nlc/system_prompt"
  config_set prompt.user "$HOME/.nlc/user_prompt"
  config_save
}