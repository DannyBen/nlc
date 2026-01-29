## Show command and optionally execute
execute_command() {
  local cmd="$1"
  if [[ -z "$cmd" ]]; then
    printf "\rerror: model returned empty output" >&2
    exit 2
  fi

  printf "\r%s %s " "$(blue '$')" "$(green_bold "$cmd")"

  local choice=""
  if ! IFS= read -r choice; then
    echo ""
  fi

  echo ""

  if [[ -z "$choice" ]]; then
    /bin/bash -lc "$cmd"
    exit $?
  else
    echo "Cancelled."
    exit 0
  fi
}
