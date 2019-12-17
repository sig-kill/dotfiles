# Path to your oh-my-zsh installation.
export ZSH=/home/edward/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="todo"
ZSH_THEME="alanpeabody"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true" 

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(command-not-found git common-aliases git-extras fzf-zsh compleat zsh-syntax-highlighting)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/bin/core_perl"
# export MANPATH="/usr/local/man:$MANPATH"

#### startup tmux
#if command -v tmux>/dev/null; then
  #[[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux -2
#fi
source $ZSH/oh-my-zsh.sh

#
# fuzzy completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#zstyle ':completion:*' accept-exact '*(N)'
#zstyle ':completion:*' use-cache on
#zstyle ':completion:*' cache-path ~/.zsh/cache
#zstyle ':completion:*' matcher-list 'r:[[:ascii:]]||[[:ascii:]]=** r:|=* m:{a-z\-}={A-Z\_}'

# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

export FZF_CTRL_T_OPTS="--select-1 --exit-0 --preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

# Python virtualenvwrapper
source /usr/sbin/virtualenvwrapper.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"
alias :e="nvim"
alias :q="exit"
alias please='sudo $(fc -ln -1)'
alias rm='rm -I'
alias variety='~/.config/scripts/wallpaper'
alias ayylmao='figlet ayylmao'
alias git='hub'
alias search='rg --no-line-number --no-heading . | fzf'
alias searchh='rg --hidden --no-line-number --no-heading . | fzf'

export VISUAL="vim"
export EDITOR="vim"
export QT_STYLE_OVERRIDE=GTK+
export STEAM_RUNTIME=0

setopt HIST_IGNORE_SPACE

# automatically update colorscheme
~/.config/scripts/colorshift.sh < ~/.Xcolors
trap "~/.config/scripts/colorshift.sh < ~/.Xcolors" USR1

#~/git/projects/todo/todo.py

# fix NTFS directory colors being unreadable in ls
eval $(dircolors -b .dircolors)

