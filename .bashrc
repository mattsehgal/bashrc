# Core Bash Functions & Shortcuts

root=~
bashrc=$root/.bashrc
tools_dir="$func_root/tools"
scripts_dir="$tools_dir/bash-scripts"

# Load all .bash scripts
if [[ -d "$scripts_dir" ]]; then
    for f in $scripts_dir/*.bash; do
        [[ -f "$f" ]] && source "$f"
    done
fi

# Reload .bashrc after changes
alias rl='reload'
function reload() {
    source $bashrc
}

# "edit" with no args opens .bashrc in VSCode
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
