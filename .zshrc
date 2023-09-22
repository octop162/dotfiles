
case ${OSTYPE} in
    darwin*)
        # Mac向け設定
        ;;
    linux*)
        # Linux向け設定
        alias open="xdg-open "
        ;;
esac  

# ------------------------------
# Aliases
# ------------------------------
alias l="ls"
alias ls="ls --color"
alias ll="ls -la"
alias la="ls -a"
alias history='history -E'

# ------------------------------
# ENVIRNMENT VARIABLE
# ------------------------------

# エディタをvimに設定
export EDITOR=vim        

# 文字コードをUTF-8に設定
export LANG=ja_JP.UTF-8  

# KCODEにUTF-8を設定
export KCODE=u           

# autotestでfeatureを動かす
export AUTOFEATURE=true  

# キーバインドをEmacsモードに設定
bindkey -e             
# cd時にディレクトリスタックにpushdする
setopt auto_pushd        
# プロンプト定義内で変数置換やコマンド置換を扱う
setopt prompt_subst      
# バックグラウンドジョブの状態変化を即時報告する
setopt notify            

# ------------------------------
# Compinit
# ------------------------------
# 補完機能を有効にする
autoload -U compinit; compinit 
setopt auto_list               # 補完候補を一覧で表示する(d)
setopt auto_menu               # 補完キー連打で補完候補を順に表示する(d)
setopt list_packed             # 補完候補をできるだけ詰めて表示する
setopt list_types              # 補完候補にファイルの種類も表示する
bindkey "^[[Z" reverse-menu-complete  # Shift-Tabで補完候補を逆順する("\e[Z"でも動作する)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完時に大文字小文字を区別しない

# ------------------------------
# History 
# ------------------------------
# ヒストリを保存するファイル
HISTFILE=~/.zsh_history   
# メモリに保存されるヒストリの件数
HISTSIZE=1000            
# 保存されるヒストリの件数
SAVEHIST=1000            
# !を使ったヒストリ展開を行う(d)
setopt bang_hist          
# ヒストリに実行時間も保存する
setopt extended_history   
# 直前と同じコマンドはヒストリに追加しない
setopt hist_ignore_dups   
# 他のシェルのヒストリをリアルタイムで共有する
setopt share_history      
# 余分なスペースを削除してヒストリに保存する
setopt hist_reduce_blanks 
# すべてのヒストリを表示する
function history-all { history -E 1 }
# マッチしたコマンドのヒストリを表示できるようにする
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# ------------------------------
# Look And Feel Settings
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