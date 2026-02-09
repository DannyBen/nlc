default_model_for_provider() {
  local provider="$1"

  case "$provider" in
    groq)
      echo "llama-3.3-70b-versatile"
      ;;
    *)
      echo "gpt-3.5-turbo"
      ;;
  esac
}
