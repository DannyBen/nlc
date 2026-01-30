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

  approve "nlc config clear --help"

  describe "deleting config"
    mkdir -p tmp
    cp fixtures/nlc_config.ini tmp
    NLC_CONFIG=tmp/nlc_config.ini
    
    approve "nlc config clear"
    [[ -f "$NLC_CONFIG" ]] && fail "$NLC_CONFIG expected to be gone"
    
    NLC_CONFIG=fixtures/nlc_config.ini

