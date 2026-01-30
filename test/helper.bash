cd ./test || exit 1
source approvals.bash

editstub() {
  echo "editstub $*"
}

reset_state() {
  [[ "$(basename "$PWD")" == "test" ]] || exit 1

  blue_bold "  resetting state"
  rm -rf tmp
  mkdir tmp
  cp fixtures/*.* tmp
}

initialize() {
  export MOCK_SERVER=http://localhost:3000
  export OPENAI_API_KEY=not-needed
  export GROQ_API_KEY=not-needed
  export EDITOR=editstub
  export NLC_CONFIG=tmp/nlc_config.ini
  export -f editstub

  if [[ "$(curl -s ${MOCK_SERVER}/ | jq -r '."mock server status"')" != "running" ]]; then
    fail "mock server not running, testing is aborted"
  fi

  if [[ "$(basename "$PWD")" != "test" ]]; then
    fail "invalid working dir: $PWD"
  fi

  reset_state
}

initialize
