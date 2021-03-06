ZSH=$HOME/.oh-my-zsh
ZSH_THEME="dpoggi"
COMPLETION_WAITING_DOTS="true"
DISABLE_AUTO_UPDATE=true

export DF_DIR=$HOME/.dotfiles
export LANG=en_US.utf-8
export PATH=$HOME/bin:$PATH
export EDITOR=vim

# General Plugins
plugins=(git git-extras github python git_remote_branch pip urltools web-search colored-man colorize)

# OS Specific
case "$(uname)" in
    Linux)
        if [ -x "$(which lsb_release)" ]; then
            DIST="$(lsb_release -is)"
        else
            echo "WARNING: You don't have lsb-release installed, can't determin distribution"
            DIST="unknown"
        fi

        case "$DIST" in
            Debian)
                plugins+=(debian)
            ;;
            
            arch)
                plugins+=(archlinux systemd)
            ;;

            RedHatEnterpriseServer)
                plugins+=(yum)
            ;;

            Ubuntu)
                plugins+=(command-not-found)
        esac
    ;;

    Darwin)
        plugins+=(terminalapp brew osx macports)
    ;;
esac


# Terminal Sepcific
case "$TERM" in
    screen) ;&
    screen-256color)
        if [ -n "$TMUX" ]; then
            plugins+=(tmux)
        else
            plugins+=(screen)
        fi
    ;;
esac

# Host Specific
case "$HOST" in
    tthompso-mn1)
        plugins+=(battery jira vagrant )
        export PATH=$PATH:/Developer/NVIDIA/CUDA-5.0/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/local/bin:/usr/local/Cellar/python26/2.6.8/bin:$HOME/Downloads/adt-bundle-mac-x86_64-20130219/sdk/platform-tools/
        export DYLD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-5.0/lib:$DYLD_LIBRARY_PATH
    ;;
esac

source $ZSH/oh-my-zsh.sh
source $DF_DIR/dotfiles.sh

# Local zshrc file to this machine
[[ -f "$HOME/.zshrc-local" ]] && source $HOME/.zshrc-local || return 0
