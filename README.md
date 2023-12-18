Setup
=====

Run the following command:

```bash
$ curl -oL https://github.com/shayan-7/dotfiles/master/setup.sh
```

1. Dependencies

```bash
sudo apt install \
    vim \ 
    i3 \ 
    htop \
    polybar \
    curl \
    git \
    cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 \
    terminator \
    scdoc \
    autoconf automake pkg-config flex bison check glib-compile-resources \
    rofi \
    network-manager \
    pacmd \
    pulseaudio-utils \
    openssh-server \
    lxapprearance \
    zsh \
    ./windscribe_2.6.14_amd64.deb  \
    lxappearance gtk-chtheme qt4-qtconfig \
    i3lock \
    build-essential openssl libssl-dev libssl1.0 libgl1-mesa-dev libqt5x11extras5 '^libxcb.*-dev' libx11-xcb-dev libglu1-mesa-dev libxrender-dev libxi-dev libxkbcommon-dev libxkbcommon-x11-dev \
    qtbase5-dev \
    picom \
    ranger \
    nitrogen \
    highlight \
    python-bidi \
    libnotify-bin \
    feh \
    arandr \
    gparted \
    dolphin \
    picom

snap install chezmoi --classic
```

## TODO:

#### Vim
1. [] Rainbow parenthesis
2. [] Go: autocompletion for struct fields on initialization
3. [] C: enhanced syntax highlighting
4. [] Go over YCM various installation methods
5. [] Test out coc.nvim
6. [] Snippet code

#### i3
1. [x] test urgent color in `polybar` config
2. [x] test tray icons from `polybar` master

