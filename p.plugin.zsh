# determines whether a command exists
cmd_exists () {
    type "$1" &> /dev/null;
}

# system-independent package management aliases
function _p.mgr() {
   if cmd_exists apt; then # prioritize apt over apt-get
    alias pi='sudo apt install'
    alias pp='sudo apt purge'
    alias pr='sudo apt remove'
    alias pu='sudo apt update'
    alias pug='sudo apt upgrade'
    alias puu='sudo apt update && sudo apt upgrade'
    alias par='sudo apt autoremove'
    alias ps='sudo apt search'
   elif cmd_exists apt-get; then
    alias pi='sudo apt-get install'
    alias pp='sudo apt-get purge'
    alias pr='sudo apt-get remove'
    alias pu='sudo apt-get update'
    alias pug='sudo apt-get upgrade'
    alias puu='sudo apt-get update && sudo apt upgrade'
    alias par='sudo apt-get autoremove'
    alias ps 'sudo apt-cache search'
  elif cmd_exists pacman; then
    alias pi='sudo pacman -S'
    alias pp='sudo pacman -R'
    alias pr='sudo pacman -Rscn'
    alias pu='sudo pacman -u'
    alias pug='sudo pacman -yyu'
    alias puu='sudo pacman -Syyu'
    alias par='sudo pacman -Rc'
    alias ps='pacman -Q'
  else
    echo "Make sure that either the pacman, apt or apt-get package managers are installed to ensure compatibility with the p plugin."
  fi
}

_p.mgr
