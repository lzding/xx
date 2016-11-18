require 'openssl'
require 'base64'

module Cipher

  def self.aes_encrypt key,content
    cipher = OpenSSL::Cipher.new('AES-128-CBC')
    cipher.encrypt
    cipher.key =  de key
    cipher.iv = de key
    encrypted = cipher.update(content) + cipher.final
    be(encrypted)
  end

  def self.aes_decrypt key,content
    cipher = OpenSSL::Cipher.new('AES-128-CBC')
    cipher.decrypt
    cipher.key =  de key
    cipher.iv = de key
    cipher.update(de content) + cipher.final
  end

  def self.be str
    Base64.encode64 str
  end

  def self.de str
    Base64.decode64 str
  end


  def self.rsa_encrypt(content)
    encrypted = OpenSSL::PKey::RSA.new File.read(Rails.root.join('config','pkcs8_private_key.pem').to_s)
    be encrypted.private_encrypt(content)
  end

  def self.rsa_decrypt(content)
    decrypted = OpenSSL::PKey::RSA.new File.read(Rails.root.join('config','rsa_public_key.pem').to_s)
    decrypted.public_decrypt de(content)
  end

end
