describe "config"
  approve "nlc config --help"
  approve "nlc config"

  approve "nlc config show --help"
  allow_diff "are a command.*"
  approve "nlc config show"

  approve "nlc config edit --help"
  approve "nlc config edit"

  approve "nlc config new --help"
  approve "nlc config new"

  approve "nlc config clear --help"

  # -- DESTRUCTIVE COMMANDS ---

  approve "nlc config clear"
  test -f "$NLC_CONFIG" && fail "$NLC_CONFIG expected to be gone"
  reset_state

