# Installs vim and vim-pathogen

# Examples
#
#   include vim
#   vim::loader
#   vim::bundle { 'syntastic':
#     source => 'scrooloose/syntastic',
#   }
#
class vim {
  $home = "/home/${id}"
  $vimrc = "${home}/.vimrc"
  $vimdir = "${home}/.vim"

  package { 'vim': }

  file { [$vimdir,
    "${vimdir}/autoload",
    "${vimdir}/bundle"]:
    ensure  => directory,
    recurse => true,
  }

  vcsrepo { "${vimdir}/vim-pathogen":
    ensure   => present,
    provider => git,
    source   => 'https://github.com/tpope/vim-pathogen.git'
  }

  file { "${vimdir}/autoload/pathogen.vim":
    target  => "${vimdir}/vim-pathogen/autoload/pathogen.vim",
    require => [
      File[$vimdir],
      File["${vimdir}/autoload"],
      File["${vimdir}/bundle"],
      Repository["${vimdir}/vim-pathogen"]
    ]
  }
}
