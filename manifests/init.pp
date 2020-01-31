# @summary Module for installing and deploying dotfiles
#
# @example
#   include dotfiles
class dotfiles (
  String $repo_clone_path,
  String $repo_dir_name,
  String $repo_url,
){
  include dotfiles::install_repo
}
