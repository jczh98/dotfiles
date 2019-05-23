#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

# Install stow from Homebrew
echo "正在检测和安装stow..."
brew list |grep stow > /dev/null 2>&1 || brew install stow
if [ $? -ne 0 ]; then
  echo "不能安装stow，请确认是否已安装Homebrew且连接互联网?" 
  exit 1;
fi

# Update files from git
echo "正在从git更新文件..."
git pull origin master
if [ $? -ne 0 ]; then  
  echo "不能更新dotfiles，请确认是否已安装git且连接互联网?" 
  exit 2;
fi

# Update symbol links using stow
function doIt() {
  for i in `ls -A link_folder`; do
    if [ -d "link_folder/$i" ]; then rm -fr ~/$i; fi;
  done
  stow link_folder
  stow --no-folding new_folder
  echo "dotfiles安装完毕。如果想立即生效，请根据shell类型执行'source ~/.bash_profile'或'source ~/.zshrc'"
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  doIt;
else
  read -p "安装dotfiles将覆盖Home目录下的相同配置，请确认是否继续? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    doIt;
  fi;
fi;
unset doIt;
