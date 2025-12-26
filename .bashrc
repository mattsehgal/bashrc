# Modify terminal text only in interactive bash
if [[ -n "${BASH_VERSION-}" && $- == *i* ]]; then
  export PS1='\u@\h:\w\$ '
fi

root=~

########################
#### Bash functions ####
########################
bashrc=$root/.bashrc

function reload() {
    source $bashrc
}

function _edit() {
    local editor="$1"
    shift

    if [[ $# -eq 0 ]]; then
        "$editor" "$bashrc"
    else
        "$editor" "$@"
    fi
}

alias edit='editc'
function editc() {
    _edit code "$@";
}

function editn() {
    _edit nano "$@";
}

function editv() {
    _edit vi "$@";
}
########################



#######################
#### Git functions ####
#######################
function gs() {
    # git status
    git status
}

function ga() {
    # git add
    git add .
}

function gas() {
    # git add status
    git add .
    git status
}

function grs() {
    # git restore --staged <file-name ... >
    git restore --staged $*
    git status
}
 
function gnb() {
    # git checkout -b <new-branch-name>
    git checkout -b $*
}
 
function gcb() {
    # git checkout <branch-name>
    git checkout $*
}

function gdb() {
    # git delete <branch-name>
	git branch -d $*
}
 
function gcm() {
    # git commit message "<message>"
    git commit -m "$*"
}
 
function gpo() {
    # git push origin <branch-name>
    git push origin $*
}
 
function gpoc() {
    # git push origin <current-branch>
    local branch=$(git rev-parse --abbrev-ref HEAD)
    git push origin "$branch"
}

function gp() {
    # git pull
    git pull
}

function grao() {
    # git remote add origin <repo-url>
    git remote add origin $*
}

function grsu() {
    # git remote set-url origin git@github.com/<user>/<repo>.git
    git remote set-url origin git@github.com/$*
}
#######################



############################
#### Nav/file functions ####
############################
alias cdls='cd_ls'
function cd_ls() {
    local dir="$1"
    cd $dir
    ls -al
}

alias tols='touch_ls'
function touch_ls() {
    local file="$1"
    touch $file
    ls -al
}

alias nf='new_file'
function new_file() {
    local file="$1"
    touch $file
    code $file
}

alias mkcd='mkdir_cd'
function mkdir_cd() {
    local dir="$1"
    mkdir $dir
    cd $dir
}

alias mkto='mkdir_touch'
function mkdir_touch() {
    local dir="$1"
    local file="$2"
    mkdir $dir
    touch $file
}

alias mktc='mkdir_touch_cd'
function mkdir_touch_cd() {
    local dir="$1"
    local file="$2"
    mkdir $dir
    touch $dir/$file
    cd $dir
}

alias rmd='rm_dir'
function rm_dir() {
    local dir="$1"
    rm -rf $dir
}

alias rmls='rm_ls'
function rm_ls() {
    local file="$1"
    rm $file
    ls -al
}

alias rmin='rm_in'
function rm_in() {
    local dir="$1"
    rm -rf $dir/*
}

function @() {
	local dir
	for depth in {1..3}; do
		dir=$(find . -maxdepth $depth -type d -name "*$1*" | head -n 1)
		if [[ -n $dir ]]; then
			echo "switching to: $dir"
			cd "$dir" || return
			return
		fi
	done
	echo "no match"
}

function handle_at() {
    local base_dir="$1"
    shift
    if [[ $1 == "@" ]]; then
        cd "$base_dir" || return
        shift
        @ "$@"
    else
        cd "$base_dir/$*"
    fi
}

func_root=$root/Developer

function home() {
    handle_at "$root" "$@"
}

function root() {
    handle_at "$func_root" "$@"
}

alias rls='release'
function release() {
    handle_at "$func_root/release" "$@"
}

alias tls='tools'
function tools() {
    handle_at "$func_root/tools" "$@"
}

alias ws='workspace'
function workspace() {
    handle_at "$func_root/workspace" "$@"
}
#############################



#######################
#### Mac functions ####
#######################
# Req: Shortcut named "nightlight" that toggles Night Shift
alias nl='nightlight'
function nightlight() {
    shortcuts run "nightlight"
}
#######################



##########################
#### Terminal scripts ####
##########################
tools_dir="$func_root/tools"
scripts_dir="$tools_dir/terminal-scripts"

# Source every regular file in the terminal scripts dir
if [[ -d "$scripts_dir" ]]; then
    echo "scripts:"
    local i=0
    while IFS= read -r f; do
        [[ -n "$f" ]] || continue
        filename="${f##*/}"
        source "$f"
        local pattern="*~*~*~*|"
        if [[ $i == 1 ]]; then
            pattern="~*~*~*~|"
            i=0
        else
            i=1
        fi
        echo "$pattern $filename"
    done < <(find "$scripts_dir" -maxdepth 1 -type f -print | LC_ALL=C sort)
fi

# function n_functions() {
#     n=$(grep -E '^[[:space:]]*(function[[:space:]]+)?[a-zA-Z_][a-zA-Z0-9_]*[[:space:]]*\(\)' $bashrc | wc -l)
#     echo "$n functions loaded" | xargs
# }
##########################