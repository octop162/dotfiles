
# ------------------------------
# 環境別設定
# ------------------------------
case ${OSTYPE} in
    darwin*)
        ;;
    linux*)
        alias open="xdg-open "
        ;;
esac  

# ------------------------------
# Alias
# ------------------------------
alias l="ls"
alias ls="ls --color"
alias ll="ls -la"
alias la="ls -a"
alias history='history -E'

# ------------------------------
# 環境変数
# ------------------------------
export EDITOR=vim        
export LANG=ja_JP.UTF-8  
export KCODE=u           
export AUTOFEATURE=true  

# ------------------------------
# 補完
# ------------------------------
autoload -U compinit; compinit 
setopt auto_list
setopt auto_menu
setopt list_packed
setopt list_types
bindkey "^[[Z" reverse-menu-complete 
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 
bindkey -e             
setopt auto_pushd        
setopt prompt_subst      
setopt notify            

# ------------------------------
# History 
# ------------------------------
HISTFILE=~/.zsh_history   
HISTSIZE=1000            
SAVEHIST=1000            
setopt bang_hist          
setopt extended_history   
setopt hist_ignore_dups   
setopt share_history      
setopt hist_reduce_blanks 
function history-all { history -E 1 }
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# ------------------------------
# 表示
# ------------------------------
export LSCOLORS=Exfxcxdxbxegedabagacad
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export ZLS_COLORS=$LS_COLORS
export CLICOLOR=true
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# 一般ユーザー
autoload -U colors; colors
tmp_prompt="%F{green}[%n@%D{%m/%d %T}]%f "
tmp_prompt2="%{${fg[cyan]}%}%_> %{${reset_color}%}"
tmp_rprompt="%{${fg[blue]}%}[%~]%{${reset_color}%}"
tmp_sprompt="%{${fg[yellow]}%}%r is correct? [Yes, No, Abort, Edit]:%{${reset_color}%}"

# rootユーザー
if [ ${UID} -eq 0 ]; then
  tmp_prompt="%B%U${tmp_prompt}%u%b"
  tmp_prompt2="%B%U${tmp_prompt2}%u%b"
  tmp_rprompt="%B%U${tmp_rprompt}%u%b"
  tmp_sprompt="%B%U${tmp_sprompt}%u%b"
fi
PROMPT=$tmp_prompt    
PROMPT2=$tmp_prompt2  
RPROMPT=$tmp_rprompt  
SPROMPT=$tmp_sprompt  

# SSH
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
  PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
;

# ------------------------------
# その他
# ------------------------------
source ~/.zshlocal