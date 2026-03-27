# Navigation Functions & Shortcuts

alias cl='clear'

alias cdls='cd_ls'
function cd_ls() {
    local dir="$1"
    cd $dir
    ls -al
}

alias cdto='cd_touch'
function cd_touch() {
    local dir="$1"
    local file="$2"
    cd $dir
    touch $file
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

alias rn='rename'
function rename() {
    local old_name="$1"
    local new_name="$2"
    local dir="${3:-.}"
    mv "$dir/$old_name" "$dir/$new_name"
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
		dir=$(find . -maxdepth $depth -type d -iname "*$1*" | head -n 1)
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
    if [[ ${1,,} == "@" ]]; then
        cd "$base_dir" || return
        shift
        @ "$@"
    else
        cd "$base_dir/$*"
    fi
}

func_root=$root/Developer
# Windows: func_root=$root/tmp

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
    handle_at "$tools_dir" "$@"
}

alias ws='workspace'
function workspace() {
    handle_at "$func_root/workspace" "$@"
}
