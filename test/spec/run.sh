#!/usr/bin/env bash
describe "run"
  approve "nlc run"

describe "run --help"
  approve "nlc run --help"

describe "run COMMAND"
  approve "echo | nlc run do something" "nlc_run_do_something"

  context "on curl error"
    export NLC_CONFIG=fixtures/nlc_config_curl_err.ini
    approve "echo | nlc run error" "nlc_run_curl_error"
    export NLC_CONFIG=fixtures/nlc_config.ini

  context "on api error"
    export NLC_CONFIG=fixtures/nlc_config_api_err.ini
    approve "echo | nlc run error" "nlc_run_api_error"
    export NLC_CONFIG=fixtures/nlc_config.ini

