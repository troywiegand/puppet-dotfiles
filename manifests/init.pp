# @summary Module for installing and deploying dotfiles
#
# @example
#   include dotfiles
class dotfiles (
  String $repo_clone_path,
  String $repo_dir_name,
  String $repo_url,
){
  contain dotfiles::install_git
  contain dotfiles::clone_pull
  contain dotfiles::bashrc

  Class['::dotfiles::install_git']
  -> Class['::dotfiles::clone_pull']
  -> Class['::dotfiles::bashrc']
}
