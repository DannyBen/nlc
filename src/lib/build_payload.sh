## Build OpenAI-compatible chat payload
build_payload() {
  local message="$1"

  jq -n \
    --arg model "$model" \
    --arg system "$system_prompt" \
    --arg user "$message" \
    '{
      model: $model,
      messages: [
        {role: "system", content: $system},
        {role: "user", content: $user}
      ],
      temperature: 0,
      max_tokens: 512
    }'
}