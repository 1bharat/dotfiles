
#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi


export TERM=xterm-256color

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"
export ALTERNATE_EDITOR="emacs -nw"
export VISUAL="emacs -nw"
export EDITOR="$VISUAL"
export PATH="${HOME}/.npm-packages/bin:$PATH"

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo)

export SPACESHIP_CHAR_SYMBOL="⌘";
export PURE_PROMPT_SYMBOL="⌘"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/bharat/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/bharat/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/bharat/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/bharat/google-cloud-sdk/completion.zsh.inc'; fi

export IMAGE_FAMILY="pytorch-latest-gpu" # or "pytorch-latest-cpu" for non-GPU instances
export ZONE="us-west1-b" # budget: "us-west1-b"
export INSTANCE_NAME="my-fastai-instance"
export INSTANCE_TYPE="n1-highmem-8" # budget: "n1-highmem-4"

export PATH="$HOME/.jenv/bin:$PATH"

source ~/.env

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_R_OPTS='--sort --exact'
export FZF_TMUX=1
