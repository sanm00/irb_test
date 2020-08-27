require 'openssl'
require 'base64'
class RsaTest
  class << self
    def create_key
      key = OpenSSL::PKey::RSA.generate(2048, 3)
      private_key = Base64.encode64(key.to_pem).gsub("\n", '')
      public_key = Base64.encode64(key.public_key.to_pem).gsub("\n", '')
      [private_key, public_key]
    end

    def public_encrypt(public_key, str)
      pub = OpenSSL::PKey::RSA.new(Base64.decode64(public_key))
      Base64.encode64(pub.public_encrypt(str)).gsub("\n", '')
    end

    def private_decrypt(private_key, str)
      pri = OpenSSL::PKey::RSA.new(Base64.decode64(private_key))
      pri.private_decrypt(Base64.decode64(str))
    end

  end
end