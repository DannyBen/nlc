#!/usr/bin/env bash
describe "run"
  approve "nlc run"

describe "run --help"
  approve "nlc run --help"

describe "run COMMAND"
  approve "echo | nlc run do something" "nlc_run_do_something"

  context "when OPENAI_API_KEY is missing but config has ai.api_key"
    export OPENAI_API_KEY=
    export NLC_CONFIG=fixtures/nlc_config_with_api_key.ini
    approve "echo | nlc run do something" "nlc_run_do_something_config_key_only"
    export OPENAI_API_KEY=not-needed
    export NLC_CONFIG=fixtures/nlc_config.ini

  context "when both OPENAI_API_KEY and ai.api_key are missing"
    export OPENAI_API_KEY=
    export NLC_CONFIG=fixtures/nlc_config.ini
    approve "echo | nlc run do something" "nlc_run_missing_openai_key"
    export OPENAI_API_KEY=not-needed
    export NLC_CONFIG=fixtures/nlc_config.ini

  context "on curl error"
    export NLC_CONFIG=fixtures/nlc_config_curl_err.ini
    approve "echo | nlc run error" "nlc_run_curl_error"
    export NLC_CONFIG=fixtures/nlc_config.ini

  context "on api error"
    export NLC_CONFIG=fixtures/nlc_config_api_err.ini
    approve "echo | nlc run error" "nlc_run_api_error"
    export NLC_CONFIG=fixtures/nlc_config.ini
