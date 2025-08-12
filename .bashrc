# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color | *-256color) color_prompt=yes ;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
  else
    color_prompt=
  fi
fi

if [ "$color_prompt" = yes ]; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm* | rxvt*)
  PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
  ;;
*) ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  #alias dir='dir --color=auto'
  #alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export http_proxy=http://webproxy.ext.ti.com:80
export https_proxy=http://webproxy.ext.ti.com:80
export ftp_proxy=http://webproxy.ext.ti.com:80
export no_proxy=.ti.com

export PATH="$HOME/neovim/bin:$PATH"

#######################################################################################################################

export PATH=~/.local/bin:$PATH
export PATH=~/arm-gnu-toolchain-14.2.rel1-x86_64-aarch64-none-linux-gnu/bin:$PATH

#To clean the kernel
alias lmake-clean='make -j16 ARCH=arm64 O=build CROSS_COMPILE=aarch64-none-linux-gnu- mrproper'
# To build linux kernel configuration
alias clmake='make -j16 defconfig ti_arm64_prune.config ARCH=arm64 O=build CROSS_COMPILE=aarch64-none-linux-gnu-'
# To build the entire kernel
alias lmake='sudo -v && make -j16 ARCH=arm64 O=build CROSS_COMPILE=aarch64-none-linux-gnu-'
# To build only modules
alias mlmake='make -j16 ARCH=arm64 O=build CROSS_COMPILE=aarch64-none-linux-gnu- modules'
# To build only modules
alias ilmake='make -j16 ARCH=arm64 O=build CROSS_COMPILE=aarch64-none-linux-gnu- Image'
# To build only dts
alias dlmake='make -j16 ARCH=arm64 O=build CROSS_COMPILE=aarch64-none-linux-gnu- dtbs'
#To build config for linux (mainline)
alias l-clmake='make -j16 defconfig ARCH=arm64 O=build CROSS_COMPILE=aarch64-none-linux-gnu-'

#li = linux-install (short for ease of use)
alias li='~/wfautomation/scripts/sdmmc_install.sh /media/rishikesh ~/ti-linux-kernel/build'

# To reboot the board using switch board
alias rb='~/wfautomation/scripts/switchboard.sh 1'
alias rv='~/wfautomation/scripts/switchboard.sh 2'

#lie = linux-install-edgeai
alias lir='~/wfautomation/scripts/sdmmc_install.sh /media/rishikesh ~/ti-linux-kernel/build && rb'
alias lie='~/wfautomation/scripts/sdmmc_install_edgeai.sh /media/rishikesh ~/ti-linux-kernel/build'
alias lief='~/wfautomation/scripts/sdmmc_install_edgeai_quick_new.sh /media/rishikesh ~/ti-linux-kernel/build'

alias sli='~/wfautomation/scripts/sdmmc_install.sh /media/rishikesh ~/spare/ti-linux-kernel/build'
alias uli='~/wfautomation/scripts/sdmmc_install.sh /media/rishikesh ~/upstream/linux/build'
alias slie='~/wfautomation/scripts/sdmmc_install_edgeai.sh /media/rishikesh ~/spare/ti-linux-kernel/build'
alias ulie='~/wfautomation/scripts/sdmmc_install_edgeai.sh /media/rishikesh ~/upstream/linux/build'

alias lier='~/wfautomation/scripts/sdmmc_install_edgeai.sh /media/rishikesh ~/ti-linux-kernel/build && rb'
alias liefr='~/wfautomation/scripts/sdmmc_install_edgeai_quick_new.sh /media/rishikesh ~/ti-linux-kernel/build && rb'
alias uliefr='~/wfautomation/scripts/sdmmc_install_edgeai_quick_new.sh /media/rishikesh ~/upstream/linux/build && rb'

alias slir='~/wfautomation/scripts/sdmmc_install.sh /media/rishikesh ~/spare/ti-linux-kernel/build && rb'
alias slier='~/wfautomation/scripts/sdmmc_install_edgeai.sh /media/rishikesh ~/spare/ti-linux-kernel/build && rb'

alias ulir='~/wfautomation/scripts/sdmmc_install.sh /media/rishikesh ~/upstream/linux/build && rb'
alias ulier='~/wfautomation/scripts/sdmmc_install_edgeai.sh /media/rishikesh ~/upstream/linux/build && rb'

# SDMMC
alias mmc0='sudo minicom -D /dev/ttyUSB0'
alias mmc4='sudo minicom -D /dev/ttyUSB4'

# CD alias to speed up changing directory to frequent ones
alias cddts='cd ~/ti-linux-kernel/arch/arm64/boot/dts/ti/'
alias scddts='cd ~/spare/ti-linux-kernel/arch/arm64/boot/dts/ti/'
alias ucddts='cd ~/upstream/linux/arch/arm64/boot/dts/ti/'

alias lg='ls | grep '

alias pixelviewer='~/pixview/PixelViewer'
alias ctoken='cat ~/token.txt | xclip -selection clipboard'
alias pctoken='cat ~/ptoken.txt | xclip -selection clipboard'
#alias coverlay='echo "/dtb/ti/k3-am62x-sk-csi2-v3link-fusion.dtbo dtb/ti/k3-v3link-imx219-0-0.dtbo dtb/ti/k3-v3link-imx219-0-1.dtbo dtb/ti/k3-v3link-imx219-0-2.dtbo dtb/ti/k3-v3link-imx219-0-3.dtbo dtb/ti/k3-am62a7-sk-edgeai.dtbo
#" | xclip -selection clipboard'
alias coverlay='echo "ti/k3-am62x-sk-csi2-v3link-fusion.dtbo ti/k3-v3link-imx219-0-0.dtbo ti/k3-v3link-imx219-0-1.dtbo ti/k3-v3link-imx219-0-2.dtbo ti/k3-v3link-imx219-0-3.dtbo ti/k3-am62a7-sk-edgeai.dtbo
" | xclip -selection clipboard'
alias cpipe='cat ~/pipe.txt | xclip -selection clipboard'

# sync kernel using scp

alias scpsync='~/wfautomation/scripts/sync_kernel.sh ~/ti-linux-kernel/build'
alias scpsyncf='~/wfautomation/scripts/sync_kernel_quick.sh ~/ti-linux-kernel/build/'

alias scpsyncr='~/wfautomation/scripts/scp_rb_helper.sh ~/ti-linux-kernel/build/'
alias scpsyncfr='~/wfautomation/scripts/scp_rb_helper_quick.sh ~/ti-linux-kernel/build/'

alias uscpsync='~/wfautomation/scripts/sync_kernel.sh ~/upstream/linux/build'
alias uscpsyncr='~/wfautomation/scripts/scp_rb_helper.sh ~/upstream/linux/build/'

alias uscpsyncf='~/wfautomation/scripts/sync_kernel_quick_upstream.sh ~/upstream/linux/build/'
alias uscpsyncfr='~/wfautomation/scripts/scp_rb_helper_quick_upstream.sh ~/upstream/linux/build/'

alias sscpsync='~/wfautomation/scripts/sync_kernel.sh ~/spare/ti-linux-kernel/build/'
alias sscpsyncr='~/wfautomation/scripts/scp_rb_helper.sh ~/spare/ti-linux-kernel/build/'

alias sscpsyncf='~/wfautomation/scripts/sync_kernel_quick_upstream.sh ~/spare/ti-linux-kernel/build/'
alias sscpsyncfr='~/wfautomation/scripts/scp_rb_helper_quick_upstream.sh ~/spare/ti-linux-kernel/buildg'

alias scpsyncf_norb='~/wfautomation/scripts/no_rb.sh'

alias setup_am62a_edgeai='~/wfautomation/scripts/setup_am62a_edgeai.sh'
alias setup_am62a_edgeai_upstream='~/wfautomation/scripts/setup_am62a_edgeai_upstream.sh'
alias setup_tiovxapps='sudo cp -r ~/edgeai-tiovx-apps /media/rishikesh/rootfs/opt/ && sync'

alias scpsync_tiovx='~/wfautomation/scripts/sync_tiovx.sh'
alias scpsync_tiovxf='~/wfautomation/scripts/sync_tiovx_quick.sh'

alias getlu='~/wfautomation/scripts/get_uname_from_Image.sh'
alias sgetlu='~/wfautomation/scripts/get_uname_from_Image_spare.sh'
alias ugetlu='~/wfautomation/scripts/get_uname_from_Image_upstream.sh'

alias checkpatch='~/wfautomation/scripts/final_checkpatch.sh'
alias cgit-send='cat ~/git-patch-send-email-coms'

alias cssh='cat .ssh/id_ed25519.pub | xclip -selection clipboard'

alias kpv='~/kernel_patch_verify/kpv -V -C -L -c arch/arm64/configs/defconfig -n'

alias cpscripts='sudo cp ~/wfautomation/board/am62a/*.sh /media/rishikesh/rootfs/opt/edgeai-gst-apps/'

alias cptests='~/wfautomation/scripts/dev_test_sync.sh'
alias grh='~/wfautomation/scripts/irebase.sh'
alias gpts='git pull ti-linux ti-linux-6.12.y-cicd --rebase'

alias wi='~/wfautomation/scripts/wget_image.sh'
alias wie='~/wfautomation/scripts/wget_image_edgeai.sh'
