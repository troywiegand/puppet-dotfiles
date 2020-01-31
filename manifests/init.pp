# @summary Module for installing and deploying dotfiles
#
# @example
#   include dotfiles
class dotfiles (
  String $repoURL,
  String $repoPath,
){
  include dotfiles::install_repo
}
