require 'rails_helper'

describe AuthenticationTokenService do
  describe '.call' do
    it 'returns an authentication token' do 
      expect(described_class.call).to eq('234')
    end
  end
end