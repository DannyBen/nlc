## Validate client environemnt variables exist
filter_api_key_found() {
  local openai_key="${OPENAI_API_KEY:-}"
  local groq_key="${GROQ_API_KEY:-}"

  if [[ "$provider" == "openai" && -z "$openai_key" ]]; then
    echo "OPENAI_API_KEY not set"
  elif [[ "$provider" == "groq" && -z "$groq_key" ]]; then
    echo "GROQ_API_KEY not set"
  fi
}
