export ZSH="$HOME/.oh-my-zsh"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/usr/local/opt/ncurses/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/share/npm/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/node/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:$PATH"
export CPPFLAGS="-I/usr/local/opt/ncurses/include"
export EDITOR='vim'
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LDFLAGS="-L/usr/local/opt/ncurses/lib"
export MANPATH="/usr/local/man:$MANPATH"
export NODE_PATH="/usr/local/lib/node"
export NODE_PATH=$NODE_PATH:/usr/local/lib/node_modules
export PKG_CONFIG_PATH="/usr/local/opt/ncurses/lib/pkgconfig"
export PYTHONIOENCODING=UTF-8

ZSH_THEME="mel"
ENABLE_CORRECTION="true"
HYPHEN_INSENSITIVE="true"

plugins=(
	brew
	dirhistory
	docker
	encode64
	extract
	gem
	gitfast
	history
	jsontools
	last-working-dir
	osx
	pip
	python
	repo
	vscode
	xcode
	zsh-autosuggestions
)

alias zshconfig="code ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"
alias deploy-major='git tag -f deploy-major && git push origin deploy-major --no-verify'
alias deploy-minor='git tag -f deploy-minor && git push origin deploy-minor --no-verify'
alias deploy-patch='git tag -f deploy-patch && git push origin deploy-patch --no-verify'
alias deploy-prerelease='git tag -f deploy-prerelease && git push origin deploy-prerelease --no-verify && prerelease-version'
alias prerelease-version='echo $(cat package.json | jq -r .version)-alpha.$(git rev-parse --short HEAD)'
alias psgrep="ps Ao pid,comm|ruby -e 'puts STDIN.read.gsub(/^ *(\d+) .*?([^\/]+?$)/,\"\\\1: \\\2\")'|grep -iE"
alias cl="fc -e -|pbcopy"
alias cpwd='pwd|tr -d "\n"|pbcopy'
alias ip="curl icanhazip.com"
alias scrape="wget --recursive --level=inf --timestamping --page-requisites --adjust-extension --convert-links --backup-converted --wait=1 --random-wait"
alias ihasconflicts="grep -rl '<<<<<<< HEAD' * | wc -l"

gz() {
    echo "orig size    (bytes): "
    cat "$1" | wc -c
    echo "gzipped size (bytes): "
    gzip -c "$1" | wc -c
}
lsz() {
	if [ $# -ne 1 ]
	then
		echo "lsz filename.[tar,tgz,gz,zip,etc]"
		return 1
	fi
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2|*.tar.gz|*.tar|*.tbz2|*.tgz) tar tvf $1;;
			*.zip)  unzip -l $1;;
			*)      echo "'$1' unrecognized." ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}
chgext() {
    for file in *.$1 ; do mv $file `echo $file | sed "s/\(.*\.\)$1/\1$2/"` ; done
}
calc () { echo $@ | bc -l;}

if [[ `uname` == 'Darwin' ]]; then
	source ~/.macos
fi

eval "$(starship init zsh)"

source $ZSH/oh-my-zsh.sh
