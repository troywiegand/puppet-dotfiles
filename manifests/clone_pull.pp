# @summary Clone and Pull dotfiles from public GH page
#
# @example
#   include dotfiles::clone_pull
class dotfiles::clone_pull {
  exec { "pull dotfiles":
    onlyif  => "/bin/bash test -d ${dotfiles::repo_clone_path}${dotfiles::repo_dir_name}",
    command => "/bin/echo 'sudo git pull' | /bin/bash",
    cwd     => "${dotfiles::repo_clone_path}${dotfiles::repo_dir_name}"  
  }


  exec { "clone dotfiles":
    command => "/bin/echo 'sudo git clone ${dotfiles::repo_url} ${dotfiles::repo_dir_name}' | /bin/bash",
    onlyif  => "/bin/bash test ! -d ${dotfiles::repo_clone_path}${dotfiles::repo_dir_name}",
    cwd     => $dotfiles::repo_clone_path,
    creates => "${dotfiles::repo_clone_path}${dotfiles::repo_dir_name}",
  }

}
