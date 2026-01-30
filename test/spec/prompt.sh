describe "prompt"
  approve "nlc prompt --help"
  approve "nlc prompt"

  approve "nlc prompt system --help"
  allow_diff "OS Distro:.*"
  approve "nlc prompt system"
  approve "nlc prompt system --edit"

  approve "nlc prompt user --help"
  approve "nlc prompt user"
  approve "nlc prompt user --edit"

  # -- DESTRUCTIVE COMMANDS ---

  # prepare the environment state
  system_prompt=tmp/system_prompt.txt
  user_prompt=tmp/user_prompt.txt
  rm -f "$system_prompt" "$user_prompt"
  test -f "$user_prompt" && fail "$user_prompt expected be gone"
  test -f "$system_prompt" && fail "$system_prompt expected be gone"
  
  nlc prompt system --default > /dev/null
  test -f "$system_prompt" || fail "$system_prompt expected to exist"

  nlc prompt system --clear > /dev/null
  test -f "$system_prompt" && fail "$system_prompt expected to be gone"

  touch "$user_prompt"
  test -f "$user_prompt" || fail "$user_prompt expected to exist"

  nlc prompt user --clear > /dev/null
  test -f "$user_prompt" && fail "$user_prompt expected to be gone"

  reset_state


