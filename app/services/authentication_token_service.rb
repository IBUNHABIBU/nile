class AuthenticationTokenService
  HMAC_SECRET = 'my$ecretK3y'
  ALGORITH_TYPE = 'HS256'
  def self.call
   payload = { "test" => "blah"}
   JWT.encode payload, HMAC_SECRET, ALGORITH_TYPE
  end
end