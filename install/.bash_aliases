alias jn='jupyter notebook'
alias bye='shutdown now'
alias re='shutdown -r 0'
alias dev='cd /home/disk/thesis/morphobreast/Subject/dev'
alias biblio='cd /home/disk/thesis/morphobreast/Subject/Biblio'
alias pres='cd /home/disk/thesis/morphobreast/Subject/reports/Presentations'
alias memo='cd /home/disk/thesis/morphobreast/Subject/reports/memo_previous_work'
alias vmemo='memo && vim /home/disk/thesis/morphobreast/Subject/reports/memo_previous_work/memo_previous_work.tex'
alias gcc_W='gcc -Wall -Werror -Wextra'
alias doc_is_the_best='echo Documentation is here for you!!!'
alias volontaire='cd /home/pierre/Bureau/test_C_course/;./pickastudent; cd'
alias c='clear'
alias v='nvim'
alias note='v ~/notes/mynotes.norg'
alias vpn_unistra='sudo openfortivpn vpn.unistra.fr -u p.galmiche'
alias gitlog='git log --color --graph --decorate --abbrev-commit --pretty=oneline --branches --all'
alias rm='rm -I'
alias fd='fdfind -ILH -E .git'
alias git='LANG=en_GB git'
alias config="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias notes="git --git-dir=$HOME/.notes --work-tree=$HOME"
#alias gcc_K='gcc -Wall -Werror -Wextra -o $1 $2 -ltps -lSDL2 -lSDL2_ttf'
# Usage: docompile filename
function gcc_K ()
    {
    local objname="${1}"
    local srcname="${2}"
    local libadd="-ltps -lDSL2 -lSDL2_ttf"
    gcc -Wall -Werror -Wextra -o "$objname" "$srcname" "$libadd"
    }

