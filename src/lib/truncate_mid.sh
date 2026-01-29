truncate_mid() {
  local s="$1"
  local n="${2:-5}"
  local len=${#s}

  (( len <= 2*n )) && { echo "$s"; return; }

  echo "${s:0:n}...${s:len-n:n}"
}
