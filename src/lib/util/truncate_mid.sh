truncate_mid() {
  local s="$1"
  local n="${2:-5}"
  local len=${#s}

  if ((len <= 2 * n)); then
    echo "$s"
    return
  fi

  echo "${s:0:n}...${s:len-n:n}"
}
