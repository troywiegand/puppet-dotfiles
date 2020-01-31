# @summary Clone and Pull dotfiles from public GH page
#
# @example
#   include dotfiles::install
class dotfiles::installRepo {
  package { "git":
    ensure => present,
  }

  exec { "sudo git pull":
    cwd    => '$dotfiles::repoPath',
    onlyif => 'git -v && ls $dotfiles::repoPath',
  }

  exec { "sudo git clone $dotfiles::repoURL":
    cwd    => '$dotfiles::repoPath/..',
    onlyif => 'git -v',
  }

}
