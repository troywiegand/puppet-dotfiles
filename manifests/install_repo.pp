# @summary Clone and Pull dotfiles from public GH page
#
# @example
#   include dotfiles::install
class dotfiles::install_repo {
  package { "git":
    ensure => present,
  }

  exec { "pull dotfiles":
    command => "/bin/bash sudo git pull",
    cwd    => "${dotfiles::repo_clone_path}${dotfiles::repo_dir_name}",
    onlyif => "/bin/bash ls ${dotfiles::repo_clone_path}${dotfiles::repo_dir_name}",
  }

  exec { "clone dotfiles":
    command => "/bin/bash sudo git clone ${dotfiles::repo_url} ${dotfiles::repo_dir_name}",
    cwd    => $dotfiles::repo_clone_path,
    onlyif => '/bin/bash git -v',
  }

}
