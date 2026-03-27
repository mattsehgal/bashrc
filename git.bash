# Git Functions & Shortcuts

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