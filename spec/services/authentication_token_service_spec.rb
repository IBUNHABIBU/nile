require 'rails_helper'

describe AuthenticationTokenService do
  describe '.call' do
    let(:token) { described_class.call }
    it 'returns an authentication token' do
      decoded_token = JWT.decode(
        token,
        described_class::HMAC_SECRET,
        true,
        { algorithm: described_class::ALGORITH_TYPE }
      )
      expect(decoded_token).to eq(
        [
          {"test"=>"blah"}, # payload
          {"alg"=>"HS256"} # header
        ]
      )
    end
  end
end