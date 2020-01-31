# @summary Clone and Pull dotfiles from public GH page
#
# @example
#   include dotfiles::clone_pull
class dotfiles::clone_pull {
  exec { "pull dotfiles":
    onlyif  => "/bin/bash test -d ${dotfiles::repo_clone_path}${dotfiles::repo_dir_name}",
    command => "/bin/bash sudo git -C ${dotfiles::repo_clone_path}${dotfiles::repo_dir_name} pull",
  }

  exec { "clone dotfiles":
    command => "/bin/bash sudo git clone ${dotfiles::repo_url} ${dotfiles::repo_dir_name}",
    cwd     => $dotfiles::repo_clone_path,
  }

}
