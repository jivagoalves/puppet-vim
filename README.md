# vim Puppet Module for Linux

Install [vim-pathogen](https://github.com/tpope/vim-pathogen), an easy way to install vim bundles.

This is a fork from [boxen/puppet-vim](https://github.com/boxen/puppet-vim). The code was changed to consider a regular Linux box.

## Usage
The following example will install pathogen and the vim_bundle you specify in your ~/.vim/bundle directory

    include vim
    vim::bundle { [
      'scrooloose/syntastic',
      'sjl/gundo.vim'
    ]: }

You can also manage your .vimrc with something like:

    $homedir  = "/home/${id}"
    $codepath = "${homedir}/code"

    # dotfiles repo
    vcsrepo { "${codepath}/dotfiles":
      ensure   => latest,
      provider => git,
      source   => 'https://github.com/jivagoalves/dotfiles.git',
      revision => 'master'
    }

    # Link .vimrc to file from dotfiles repo
    file { "${vim::vimrc}":
      ensure  => link,
      target  => "${codepath}/dotfiles/vimrc",
      require => Vcsrepo["${codepath}/dotfiles"]
    }

## Required Puppet Modules

* `puppetlabs-vcsrepo`
* `puppetlabs-stdlib`

## Thanks

Thanks to [boxen/puppet-vim](https://github.com/boxen/puppet-vim)'s contributors.
