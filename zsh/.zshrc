## Plugins
if [ ! -d "${HOME}/.zplug" ]; then
    echo ".zplug directory not found, installing zplug"
    git clone https://github.com/zplug/zplug ~/.zplug
fi
source ~/.zplug/init.zsh

zplug "zplug/zplug"
zplug "chrissicool/zsh-256color"
zplug "lib/git", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/git-extras", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "zdharma/fast-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search"

zplug "romkatv/powerlevel10k", as:theme, depth:1

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    echo; zplug install
fi
zplug load

## Prompt
#export PROMPT='%{$fg[magenta]%}%n%{$reset_color%}@%{$fg[yellow]%}[$TARGET_PRODUCT-$TARGET_BUILD_VARIANT]%{$fg[magenta]%}${ASP_BUILD_FROM_SOURCE++ASP} %{$fg[blue]%}%~%{$reset_color%}$ '
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    # os_icon               # os identifier
    context                 # user@hostname
    dir                     # current directory
    vcs                     # git status
    prompt_char             # prompt symbol
)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    status                  # exit code of the last command
    command_execution_time  # duration of the last command
    background_jobs         # presence of background jobs
    virtualenv              # python virtual environment (https://docs.python.org/3/library/venv.html)
    envstatus               # CUSTOM: environment status
    public_ip               # public IP address
    battery                 # internal battery
)
## Fuzzy completion
# 0 -- vanilla completion (abc => abc)
# 1 -- smart case completion (abc => Abc)
# 2 -- word flex completion (abc => A-big-Car)
# 3 -- full flex completion (abc => ABraCadabra)
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:|?=** m:{a-z\-}={A-Z\_}'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# --files: List files that would be searched but do not search
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
export FZF_DEFAULT_COMMAND='fd --hidden --follow'
export FZF_CTRL_T_OPTS="--select-1 --exit-0 --preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

## Aliases
[ -f ~/.aliases ] && source ~/.aliases
# Expand aliases with space
function expand-alias() {
    zle _expand_alias
    zle self-insert
}
zle -N expand-alias
bindkey -M main ' ' expand-alias

# cd history tab completion
setopt AUTO_PUSHD                  # pushes the old directory onto the stack
setopt PUSHD_MINUS                 # exchange the meanings of '+' and '-'
setopt CDABLE_VARS                 # expand the expression (allows 'cd -2/tmp')
autoload -U compinit && compinit   # load + start completion
zstyle ':completion:*:directory-stack' list-colors '=(#b) #([0-9]#)*( *)==95=38;5;12'

setopt INC_APPEND_HISTORY # Save commands before executed
setopt SHARE_HISTORY      # Share history between terminals
setopt HIST_IGNORE_SPACE  # Ignore commands with a space in front
setopt HIST_IGNORE_DUPS  # Ignore duplicates with ctrl R

# Additional work-specific configs I can't put on github
[ -f ~/.work-config ] && source ~/.work-config
