truncate_mid() {
  local s="$1"
  local n="${2:-5}"

  s=${s//$'\n'/}
  s=${s//$'\r'/}

  local len=${#s}

  if ((len <= 2 * n)); then
    printf '%s\n' "$s"
    return
  fi

  printf '%s\n' "${s:0:n}...${s:len-n:n}"
}
