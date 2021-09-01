class AuthenticationTokenService
  hmac_secret = 'my$ecretK3y'
  def self.call
   hmac_secret = 'my$ecretK3y'
   payload = { "test" => "blah"}
   JWT.encode payload, hmac_secret, 'HS256'
  end
end