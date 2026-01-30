if [ -r /etc/os-release ]; then
  . /etc/os-release
  echo "${PRETTY_NAME:-${NAME:-${ID:-unknown}}}"
else
  echo "Unknown"
fi
