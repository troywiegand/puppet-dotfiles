# @summary Clone and Pull dotfiles from public GH page
#
# @example
#   include dotfiles::install
class dotfiles::install_repo {
  package { "git":
    ensure => present,
  }

  exec { "sudo git pull":
    cwd    => "${dotfiles::repo_clone_path}${dotfiles::repo_dir_name}",
    onlyif => "git -v && ls ${dotfiles::repo_clone_path}${dotfile::repo_dir_name}",
  }

  exec { "sudo git clone ${dotfiles::repo_url} ${dotfiles::repo_dir_name}":
    cwd    => $dotfiles::repo_clone_path,
    onlyif => 'git -v',
  }

}
