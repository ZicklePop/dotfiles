if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

if [ ! -d "$HOME/.zsh/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
fi

if [ ! -d "$HOME/.vim_runtime" ]; then
  git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
  sh ~/.vim_runtime/install_awesome_vimrc.sh
fi

if [[ `uname` == 'Darwin' ]]; then
  if ! command -v brew > /dev/null 2>&1; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
fi

if [[ `whoami` == 'pi' ]]; then
  sudo cp ./motd /etc/motd > /dev/null 2>&1
fi

mkdir -p ~/.oh-my-zsh/custom/themes
cp -rf mel.zsh-theme ~/.oh-my-zsh/custom/themes/mel.zsh-theme > /dev/null 2>&1
cp -rf melkat.zsh-theme ~/.oh-my-zsh/custom/themes/melkat.zsh-theme > /dev/null 2>&1
cp -rf .editorconfig ~/.editorconfig > /dev/null 2>&1
cp -rf .gitconfig ~/.gitconfig > /dev/null 2>&1
cp -rf .macos ~/.macos > /dev/null 2>&1
cp -rf .zshrc ~/.zshrc > /dev/null 2>&1
