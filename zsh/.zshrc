# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Keybinds
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word
bindkey "^[^?" backward-kill-word

# Enviroment variables
export PATH=$HOME/.npm-global/bin:$HOME/devtools/flutter/bin:$HOME/.config/composer/vendor/bin:$PATH:$HOME/.local/bin:$HOME/.pub-cache/bin:$HOME/.local/share/bob/nvim-bin:$HOME/Android/Sdk/platform-tools:$HOME/Android/Sdk/emulator:$HOME/go/bin:$HOME/fvm/versions/stable/bin
export EDITOR=nvim
export CHROME_EXECUTABLE=/usr/bin/brave

# Node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Aliases
alias x="eza -alh --group-directories-first --show-symlinks --icons --no-time"
alias lg="lazygit"
alias sail='sh $([ -f sail ] && echo sail || echo vendor/bin/sail)'
alias stop-containers='docker stop $(docker ps -a -q)'
alias start-api='docker compose -f /home/dawn/projects/craftmate_api/docker-compose.yml up -d'
alias main-display-off='hyprctl keyword monitor eDP-1,disabled'
alias main-display-on='hyprctl keyword monitor eDP-1,enabled'
alias u="uwsm app --"
alias code="uwsm app -- code"
alias pa="php artisan"
alias disable-touchpad="hyprctl keyword 'device[elan0708:00-04f3:30a0-touchpad]:enabled' 'false'"
alias enable-touchpad="hyprctl keyword 'device[elan0708:00-04f3:30a0-touchpad]:enabled' 'true'"
alias proton-up="sudo wg-quick up /etc/wireguard/dawn-JP-FREE-17.conf"
alias proton-down="sudo wg-quick down /etc/wireguard/dawn-JP-FREE-17.conf"
alias dbr="dart run build_runner build"
alias update-kernel="yay -Sy linux-cachyos linux-cachyos-headers linux-cachyos-bore-lto linux-cachyos-bore-lto-headers linux-cachyos-lts linux-cachyos-lts-headers --noconfirm"

# Zinit install
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found
zinit snippet OMZP::git

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

source <(fzf --zsh)
eval "$(zoxide init --cmd cd zsh)"

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
# NOTE: don't use escape sequences here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/dawn/.dart-cli-completion/zsh-config.zsh ]] && . /home/dawn/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

eval "$(zoxide init zsh)"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# fnm
FNM_PATH="/home/dawn/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/dawn/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

