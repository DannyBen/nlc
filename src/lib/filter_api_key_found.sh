## Validate client environemnt variables exist
filter_api_key_found() {
  if [[ "$PROVIDER" == "openai" && -z "$OPENAI_API_KEY" ]]; then
    echo "OPENAI_API_KEY not set"
  elif [[ "$PROVIDER" == "groq" && -z "$GROQ_API_KEY" ]]; then
    echo "GROQ_API_KEY not set"
  fi
}
