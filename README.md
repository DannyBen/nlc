# nlc — Natural Language → Command

`nlc` is a tiny command-line helper that turns natural language instructions into executable shell commands using [OpenAI](https://platform.openai.com/) models.

It’s designed to be minimal and intuitive:

- You type what you want in plain English.
- It shows you the generated command inline with a `$` prompt.
- Press **Enter** to execute, or type anything else to cancel.

---

## Installation

Clone the repo and install requirements:

    git clone https://github.com/yourname/nlc.git
    cd nlc
    pip install -r requirements.txt   # installs openai

Make the script executable:

    chmod +x nlc.py
    mv nlc.py ~/bin/nlc   # or somewhere on your PATH

---

## Setup

Export your OpenAI API key:

    export OPENAI_API_KEY=sk-...

(Optional) Pick a default model:

    export OPENAI_MODEL=gpt-4o-mini

---

## Usage

    nlc (Natural Language → Command)

    Usage:
        nlc MESSAGE...

    Examples:
        nlc convert input.webm to output.mp4 using the best standards and ffmpeg
        nlc list all docker images older than a month and delete them

Output looks like a normal shell prompt:

    $ ffmpeg -i input.webm -c:v libx264 -crf 23 -preset veryfast output.mp4

- **Press Enter** → command runs immediately.  
- **Type anything else** → cancels execution.

---

## Features

- ⚡️ **Minimal UX** — inline `$` prompt, no clutter.  
- 🎨 **Colors** — magenta “processing…”, blue `$`, bold green command.  
- 🧠 **Flexible output** — can return single or multiple commands; they’ll be run as one bash block.  
- 🔒 **Safe defaults** — unless you explicitly request destructive actions.  

---

## Notes & Caveats

- Always **review the command** before pressing Enter — LLMs can be wrong or unsafe.  
- Works best for common CLI tools (ffmpeg, git, docker, etc).  
- Requires an internet connection and an OpenAI account.  
- Commands are executed through `/bin/bash`, so shell features (pipes, redirection, newlines) are supported.  

---

## License

MIT © Your Name
