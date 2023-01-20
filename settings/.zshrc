# shell settings
## Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
autoload -Uz compinit && compinit

## prompt initialize
fpath+=$HOME/.zsh/pure
autoload -U promptinit && promptinit
zstyle :prompt:pure:path color cyan
prompt pure

## zinit plugin
zinit ice wait lucid
zinit light zsh-users/zsh-autosuggestions



# PATH settings
## nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

## rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init - zsh)"

## python
export PATH=/usr/local/opt/python@3.9/libexec/bin:$PATH

## mint
export PATH=$HOME/.mint/bin:$PATH



# alias
alias ll="ls -l"
alias la="ls -la"
alias rmf="rm -f"
alias rmr="rm -rf"
alias gitmerged="git branch --merged | egrep -v '\*|develop|main|master' | xargs git branch -d"
alias gitc="git commit --allow-empty -m ':four_leaf_clover: branch init commit'"
alias imin="squoosh-cli --suffix '_min' --mozjpeg '{"quality":90,"baseline":false,"arithmetic":false,"progressive":true,"optimize_coding":true,"smoothing":0,"color_space":3,"quant_table":3,"trellis_multipass":false,"trellis_opt_zero":false,"trellis_opt_table":false,"trellis_loops":1,"auto_subsample":true,"roma_subsample":2,"separate_chroma_quality":false,"chroma_quality":75}'"
alias python="python3"
alias pip="pip3"
alias csx="make codegen && make swiftgen && make xcodegen"
alias ppp="git switch develop && git fetch -q && git pull && make mint_bootstrap && make pods_download && make swiftgen && make codegen && make xcodegen"
alias fixtrackpad="killall Dock"
alias xed="xed ."
