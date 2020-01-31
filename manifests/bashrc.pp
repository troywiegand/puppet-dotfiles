# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include dotfiles::bashrc
class dotfiles::bashrc {
  exec { 'move bashrc':
    onlyif  => "/bin/bash test -f ${dotfiles::repo_clone_path}${dotfiles::repo_dir_name}/.bashrc",
    command => "/bin/echo 'sudo mv ${dotfiles::repo_clone_path}${dotfiles::repo_dir_name}/.bashrc /etc/bashrc' | /bin/bash ",
    notify  => Exec['gain bothrc'],  
  }  

  exec { 'gain bothrc':
    require => Exec['move bashrc'],
    command => "/bin/echo 'sudo cat ${dotfiles::repo_clone_path}${dotfiles::repo_dir_name}/.bothrc >> /etc/bashrc' | /bin/bash ",
    onlyif  => "/bin/bash test -f ${dotfiles::repo_clone_path}${dotfiles::repo_dir_name}/.bothrc",
  }

}
