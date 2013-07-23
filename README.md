# vim Puppet Module for Linux

Install [vim](http://www.vim.org/) along with [vim-pathogen](https://github.com/tpope/vim-pathogen), an easy way to install vim bundles.

This is a fork from [boxen/puppet-vim](https://github.com/boxen/puppet-vim). The code was changed to consider a regular Linux box.

## Usage
The following example will install vim, pathogen and the vim_bundle you specify in your ~/.vim/bundle directory

    include vim
    vim::bundle { [
      'scrooloose/syntastic',
      'sjl/gundo.vim'
    ]: }

    # Example of how you can manage your .vimrc
    file { "${vim::vimrc}":
      target  => "/home/${id}/.dotfiles/.vimrc",
      require => Repository["/home/${id}/.dotfiles"]
    }

    # Or, simply,
    file { "${vim::vimrc}": ensure => exists }

## Required Puppet Modules

* `boxen`
* `boxen-repository`
* `puppetlabs-stdlib`

## Thanks

Thanks to [boxen/puppet-vim](https://github.com/boxen/puppet-vim)'s contributors.
