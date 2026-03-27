# Terminal Prompt Configuration (info + colors)

# Import Apple git prompt
# TODO: Windows compatible
_git_prompt_sh="/Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh"
[[ -f "$_git_prompt_sh" ]] && source "$_git_prompt_sh"

# Show dirty state (*) and staged state (+)
export GIT_PS1_SHOWDIRTYSTATE=1

# Colors
_pink=$'\001\e[38;5;205m\002'
_lav=$'\001\e[38;5;183m\002'
_lime=$'\001\e[38;5;154m\002'
_path_stblue=$'\001\e[38;5;75m\002'
_dim=$'\001\e[2m\002'
_rst=$'\001\e[0m\002'

# Git segment colors
_git_segment() {
  local branch
  branch=$(__git_ps1 "%s" 2>/dev/null)
  [[ -z "$branch" ]] && return
  if [[ "$branch" == *'*'* ]]; then
    printf " ${_pink}(${branch})${_rst}"
  else
    printf " ${_lav}(${branch})${_rst}"
  fi
}

# Terminal title
_set_title() { printf '\e]0;%s@%s\a' "${USER}" "${HOSTNAME%%.*}"; }
PROMPT_COMMAND='_set_title'

# Prompt
PS1="${_dim}\u@\h${_rst} ${_path_stblue}\w${_rst}\$(_git_segment)\n\$ "

# user@host when ssh'd only
# if [[ -n "$SSH_CONNECTION" ]]; then
#   PS1="${_dim}\u@\h${_rst} ${_path_stblue}\w${_rst}\$(_git_segment)\n\$ "
# else
#   PS1="${_path_stblue}\w${_rst}\$(_git_segment)\n\$ "
# fi