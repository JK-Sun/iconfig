# iconfig

vim 和 tmux 的简单配置。

- 灵活的切换窗口；
- 方便寻找已打开文件；
- ...

# 注意

操作前请先备份原有文件。

# VIM


## 配置一（推荐）

来源：https://github.com/amix/vimrc

```shell
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

curl -fLo ~/.vim_runtime/my_configs.vim https://raw.githubusercontent.com/JK-Sun/iconfig/master/my_configs.vim
```

安装vim-plug

```shell
curl -fLo ~/.vim_runtime/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

如果无法访问`https://raw.githubusercontent.com`， 配置hosts

```
199.232.28.133  raw.githubusercontent.com
```

进入vim中安装插件

```
:PlugInstall
```

安装依赖

```
# 用于fzf插件rg全文搜索
# https://github.com/BurntSushi/ripgrep#installation
brew install ripgrep

# 用于fzf插件查找文件，代替find命令，提高效率
# https://github.com/chinanf-boy/fd-zh#macos
brew install fd

# .bachrc中添加
export FZF_DEFAULT_COMMAND='fd --type file'
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
curl -fLo ~/.tmux.conf https://raw.githubusercontent.com/JK-Sun/iconfig/master/tmux.conf
```

# VIM快捷键

- `:vs`  纵向分屏
- `:sp`  横向分屏
- `Ctrl+h/j/k/l`  切换窗口
- `wm`  打开树型菜单
- `mm`  打开最近访问文件菜单
- `zR` 展开全部折叠
- `,f` 查找文件
- `,g` 全文查找

# TMUX快捷键

- `Ctrl+a`  前缀
- `Ctrl+a c`  创建窗口
- `Ctrl+d`  关闭窗口
- `Ctrl+left/right`  切换窗口
- `Shift+down`  创建窗口
- `Shift+left/right`  切换窗口
