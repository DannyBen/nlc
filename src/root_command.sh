# Build request text
local message="${args[message]}"
local cmd

printf "\n%s ..." "$(blue '$')"
cmd="$(process_request "$message")"
execute_command "$cmd"

