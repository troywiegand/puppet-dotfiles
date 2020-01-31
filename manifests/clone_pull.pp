# @summary Clone and Pull dotfiles from public GH page
#
# @example
#   include dotfiles::clone_pull
class dotfiles::clone_pull {
  exec { "pull dotfiles":
    onlyif  => "/bin/test -f ${dotfiles::repo_clone_path}${dotfiles::repo_dir_name}/.gitignore",
    command => "/bin/bash sudo git pull",
    cwd     => "${dotfiles::repo_clone_path}${dotfiles::repo_dir_name}",
  }

  exec { "clone dotfiles":
    command => "/bin/bash sudo git clone ${dotfiles::repo_url} ${dotfiles::repo_dir_name}",
    cwd     => $dotfiles::repo_clone_path,
  }

}
