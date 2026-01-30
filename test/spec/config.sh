describe "config"
  approve "nlc config --help"
  approve "nlc config"

  approve "nlc config show --help"
  allow_diff "are a command.*"
  approve "nlc config show"

  approve "nlc config edit --help"
  approve "nlc config edit"

  approve "nlc config create --help"
  approve "nlc config create"
