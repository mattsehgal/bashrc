# Core Bash Functions & Shortcuts

root=~
bashrc=$root/.bashrc
func_root="$root/Developer"
tools_dir="$func_root/tools"
scripts_dir="$tools_dir/bash-scripts"
private_dir="$root/.bashrc.d"

# Load all .bash scripts
if [[ -d "$scripts_dir" ]]; then
    for f in $scripts_dir/*.bash; do
        [[ -f "$f" ]] && source "$f"
    done
fi

# Load private/local .bash scripts (gitignored, not in repo)
if [[ -d "$private_dir" ]]; then
    for f in $private_dir/*.bash; do
        [[ -f "$f" ]] && source "$f"
    done
fi

# Reload .bashrc after changes
alias rl='reload'
function reload() {
    source $bashrc
    echo -e "> \u27F3"
    # ^ unicode reload symbol
}

# "edit" with no args opens .bashrc in VSCode
function _edit() {
    local editor="$1"
    shift

    if [[ $# -eq 0 ]]; then
        "$editor" "$bashrc"
    elif [[ $# -eq 1 && "$1" == "." ]]; then
        "$editor" "$1"
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
