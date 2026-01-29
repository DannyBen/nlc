declare -g PROVIDER
declare -g MODEL
declare -g API_KEY
declare -g API_BASE
declare -g SYSTEM_PROMPT_FILE
declare -g USER_PROMPT_FILE
declare -g EDITOR

PROVIDER="$(config_get ai.provider openai)"

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

MODEL="$(config_get ai.model "$default_model")"
API_KEY="$(config_get ai.api_key "$default_key")"
API_BASE="$(config_get ai.api_base "$default_base")"

SYSTEM_PROMPT_FILE="$(config_get prompt.system "$HOME/.nlc/system_prompt")"
USER_PROMPT_FILE="$(config_get prompt.user "$HOME/.nlc/user_prompt")"

EDITOR="${EDITOR:-vi}"
