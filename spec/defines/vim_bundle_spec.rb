
require 'spec_helper'

describe 'vim::bundle' do
  let(:title) { 'jivagoalves/puppet-vim' }
  let(:facts) { { :id => 'jivago' } }

  it do
    should contain_vcsrepo('/home/jivago/.vim/bundle/puppet-vim').with({
      'ensure'   => 'present',
      'provider' => 'git',
      'source'   => 'https://github.com/jivagoalves/puppet-vim.git',
    })
  end
end
