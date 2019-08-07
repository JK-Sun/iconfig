# iconfig

vim 和 tmux 的简单配置。

# 使用

## 方案一

**克隆脚本**

```shell
git clone https://github.com/JK-Sun/iconfig.git

cd iconfig
cp -r vim ~/.vim
cp vimrc ~/.vimrc
cp tmux.conf ~/.tmux.conf
```

**依赖**

```shell
#ubuntu
sudo apt-get install ctags

#mac
brew install ctags
```

# 方案二

https://github.com/amix/vimrc

```shell
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

cd iconfig
cp my_configs.vim ~/.vim_runtime
```
