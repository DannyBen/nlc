## Validate client environment variables exist
filter_api_key_found() {
  if [[ "$PROVIDER" == "openai" && -z "$API_KEY" ]]; then
    echo "OPENAI_API_KEY not set and ai.api_key is empty"
  elif [[ "$PROVIDER" == "groq" && -z "$API_KEY" ]]; then
    echo "GROQ_API_KEY not set and ai.api_key is empty"
  fi
}
