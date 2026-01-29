case "$provider" in
  openai)
    api_base="https://api.openai.com/v1"
    api_key="$OPENAI_API_KEY"
    model="${model:-gpt-4.1-mini}"
    ;;
  groq)
    api_base="https://api.groq.com/openai/v1"
    api_key="$GROQ_API_KEY"
    model="${model:-llama-3.3-70b-versatile}"
    ;;
esac



