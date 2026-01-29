declare -g PROVIDER="$(config_get ai.provider openai)"

case "$PROVIDER" in
  groq)
    default_base="https://api.groq.com/openai/v1"
    default_key="$GROQ_API_KEY"
    default_model="llama-3.3-70b-versatile"
    ;;
  *)
    default_base="https://api.openai.com/v1"
    default_key="$OPENAI_API_KEY"
    default_model=gpt-4.1-mini
    ;;
esac

declare -g MODEL="$(config_get ai.model "$default_model")"
declare -g API_KEY="$(config_get ai.api_key "$default_key")"
declare -g API_BASE="$(config_get ai.api_base "$default_base")"

declare -g SYSTEM_PROMPT_FILE="$(config_get prompt.system "$HOME/.nlc/system_prompt")"
declare -g USER_PROMPT_FILE="$(config_get prompt.user "$HOME/.nlc/user_prompt")"

declare -g EDITOR="${EDITOR:-vi}"
