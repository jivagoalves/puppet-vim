
require 'spec_helper'

describe 'vim::bundle' do
  let(:title) { 'jivagoalves/puppet-vim' }
  let(:facts) { { :id => 'jivago' } }

  it do
    should contain_repository('/home/jivago/.vim/bundle/puppet-vim').with({
      'source' => 'jivagoalves/puppet-vim'
    })
  end
end
