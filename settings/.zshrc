# shell settings
## zsh auto complement
autoload -U compinit
compinit

## prompt initialize
fpath+=$HOME/.zsh/pure
autoload -U promptinit
promptinit
zstyle :prompt:pure:path color cyan

## use prompt pure
prompt pure

# alias
alias ll="ls -l"
alias la="ls -la"
alias rmf="rm -f"
alias rmr="rm -rf"

# PATH settings
## nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

## rbenv
export PATH=${HOME}/.rbenv/bin:${PATH}
eval "$(rbenv init -)"
eval "$(rbenv init -)"
eval "$(rbenv init -)"
eval "$(rbenv init -)"

## python
export PATH=/usr/local/opt/python@3.9/libexec/bin:$PATH
