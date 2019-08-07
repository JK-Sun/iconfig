# iconfig

vim 和 tmux 的简单配置。

# VIM

## 配置一

克隆

```shell
git clone https://github.com/JK-Sun/iconfig.git

cd iconfig
cp -r vim ~/.vim
cp vimrc ~/.vimrc
```

依赖

```shell
# ubuntu
sudo apt-get install ctags

# mac
brew install ctags
```

## 配置二

https://github.com/amix/vimrc

```shell
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

cd iconfig
cp my_configs.vim ~/.vim_runtime
```

# TMUX

安装

```shell
# ubuntu
sudo apt-get install tmux

# mac
brew install tmux
```

配置

```shell
git clone https://github.com/JK-Sun/iconfig.git
cp tmux.conf ~/.tmux.conf
```
