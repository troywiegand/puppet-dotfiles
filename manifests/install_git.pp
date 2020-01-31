# @summary Ensure git is present
#
# @example
#   include dotfiles::install
class dotfiles::install_git {
  package { "git":
    ensure => present,
  }
}
