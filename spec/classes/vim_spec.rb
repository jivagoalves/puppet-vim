require 'spec_helper'

describe 'vim' do
  let :facts do
    { :id => 'jivago' }
  end

  it do
    should contain_package('vim')

    should contain_repository("/home/jivago/.vim/vim-pathogen")
    should contain_file("/home/jivago/.vim/autoload").with({
      'ensure'    => 'directory',
      'recurse'   => true,
    })
    should contain_file("/home/jivago/.vim/autoload/pathogen.vim").with({
      'target'  => "/home/jivago/.vim/vim-pathogen/autoload/pathogen.vim",
      'require' => [
        'File[/home/jivago/.vim]',
        'File[/home/jivago/.vim/autoload]',
        'File[/home/jivago/.vim/bundle]',
        'Repository[/home/jivago/.vim/vim-pathogen]']
    })
    should contain_file("/home/jivago/.vim/bundle").with({
      'ensure'    => 'directory',
      'recurse' => true,
    })
    should contain_file("/home/jivago/.vim").with({
      'ensure'    => 'directory',
      'recurse' => true,
    })
  end
end
