# iconfig

vim 和 tmux 的简单配置。

# 注意

操作前请先备份原有文件。

# VIM


## 配置一（推荐）

https://github.com/amix/vimrc

```shell
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

cd iconfig
cp my_configs.vim ~/.vim_runtime
```

## 配置二

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

# VIM快捷键

- `:vs`  纵向分屏
- `:sp`  横向分屏
- `Ctrl+h/j/k/l`  切换屏幕
- `wm`  打开树型菜单
- `mm`  打开最近访问文件菜单

# TMUX快捷键

- `Ctrl+a`  前缀
- `Ctrl+a c`  创建窗口
- `Ctrl+d`  关闭窗口
- `Ctrl+left/right`  切换窗口
- `Shift+down`  创建窗口
- `Shift+left/right`  切换窗口
