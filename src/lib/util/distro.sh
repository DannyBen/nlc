distro() {
  if [ -r /etc/os-release ]; then
    # shellcheck disable=SC1091
    . /etc/os-release
    echo "${PRETTY_NAME:-${NAME:-${ID:-unknown}}}"
  else
    echo "Unknown"
  fi
}