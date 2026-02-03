# nlc - Natural Language -> Command

![repocard](repocard.svg)

`nlc` is a command-line bash script that turns natural language instructions
into executable shell commands using
[OpenAI](https://platform.openai.com/) models, or any model available through
[Groq](https://groq.com/).

It was built with [Bashly](https://bashly.dev).

## Demo

![demo](support/demo/cast.gif)

## Usage

The primary usage pattern looks like this:

- You type what you want in plain English.
- It shows you the generated command inline with a `$` prompt.
- Press **Enter** to execute, or Ctrl+C to cancel.

In addition, `nlc` comes with a few utility functions to help you manage its
configuration and prompts, which you can customize. Run `nlc --help` for more
information.

## Installation

**Manual**:  
Download the nlc file from the [releases] page, or straight from the master
branch if you want the unreleased version. Place it in your PATH.

**With eget**:  
```shell
sudo eget dannyben/nlc --to /usr/local/bin
```

[releases]: https://github.com/DannyBen/nlc/releases
