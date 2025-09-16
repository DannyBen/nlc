# nlc — Natural Language → Command

`nlc` is a tiny command-line helper that turns natural language instructions into executable shell commands using [OpenAI](https://platform.openai.com/) models.

It’s designed to be minimal and intuitive:

- You type what you want in plain English.
- It shows you the generated command inline with a `$` prompt.
- Press **Enter** to execute, or anything else to cancel.

## Installation

1. Download the nlc file and place it in your path
2. Install `openai`
   ```console
   pip install openai
   # or
   uv tool install openai
   ```

## Setup

1. Export your OpenAI API key:
   ```console
   export OPENAI_API_KEY=sk-...
   ```

2. (Optional) Pick a default model:
   ```console
   export OPENAI_MODEL=gpt-4o-mini
   ```
