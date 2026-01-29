# nlc — Natural Language → Command

`nlc` is a command-line helper that turns natural language instructions
into executable shell commands using
[OpenAI](https://platform.openai.com/) models, or any model available through
[Groq](https://groq.com/).

- You type what you want in plain English.
- It shows you the generated command inline with a `$` prompt.
- Press **Enter** to execute, or anything else to cancel.

## Usage

`nlc` is built with [Bashly](https://bashly.dev) and includes utility
subcommands. Use `nlc --help` to see top-level commands, then
`nlc COMMAND --help` for details.

At a high level:

- `run` (default) turns a natural language message into a shell command.
- `config` lets you create, edit, show, or clear the config file.
- `prompt` lets you view or customize the system and user prompts.

## Installation

**Manual**:  
Download the nlc file from the [releases] page, or straight from the master
branch if you want the unreleased version. Place it in your path.

**With eget**:  
```shell
sudo eget dannyben/nlc --to /usr/local/bin
```

[releases]: https://github.com/DannyBen/nlc/releases
