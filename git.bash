# Git Functions & Shortcuts

# Skip the merge-message editor on `git pull` non-fast-forward merges.
# (`core.mergeoptions = --no-edit` in ~/.gitconfig isn't honored by `git pull`.)
export GIT_MERGE_AUTOEDIT=no

function gs() {
    # git status
    git status
}

function ga() {
    # git add
    if [[ $# -gt 0 ]]; then
        git add "$@"
    else
        git add .
    fi
}

function gas() {
    # git add status
    git add .
    git status
}

function gd() {
    # git diff
    git diff
}

function grs() {
    # git restore --staged <file-name ... >
    if [[ $# -gt 0 ]]; then
        git restore --staged "$@"
    else
        git restore --staged .
    fi
    git status
}

function gb() {
    # git branch
    git branch
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

# Branch name completion for git shortcut functions
function _git_branch_completions() {
    local branches
    branches=$(git branch --format='%(refname:short)' 2>/dev/null)
    COMPREPLY=($(compgen -W "$branches" -- "${COMP_WORDS[COMP_CWORD]}"))
}
complete -F _git_branch_completions gcb gdb gpo