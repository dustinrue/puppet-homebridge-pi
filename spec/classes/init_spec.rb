require 'spec_helper'
describe 'pi' do

  context 'with defaults for all parameters' do
    it { should contain_class('pi') }
  end
end
