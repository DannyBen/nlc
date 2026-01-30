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
