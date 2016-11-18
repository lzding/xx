require 'openssl'
require 'base64'

encrypted = OpenSSL::PKey::RSA.new File.read '../config/pkcs8_private_key.pem'
hello = encrypted.private_encrypt("1446444069974;41517f327e7b9f4;/data/data/com.example.suplus/files/id")
#
#
 bh=Base64.encode64(hello)
#
p bh
#
pbencrypted = OpenSSL::PKey::RSA.new File.read '../config/rsa_public_key.pem'
puts pbencrypted.public_decrypt 'leugfLndXwHzNDoUn+oXGItckDfVG3wwVhvatSNlb+YHQwxx7Fduq3V7vimd\npGS/c5jMB8aDTGHRpOPzD889nbmkGELSplYjWQHpNbgM3VkTeY4RcOg6OBQr\nFnc799IncCb8t9JkKIVQbf2wYigIzv6EWdUy6izUTND4BUJq9ZXIsbUb4x1T\npoGTrTL9G3BKAZyiKMd0fWndDrbFsMcNEXgCmRURtrHhysfJ+SAWyILboPs5\nnVV4FGDUutyrWS1i0FrzuS8Sva8OvcvpLT+jXrgpjE9amsGiROjBJfnwSq4M\nvpVGE9I4nuB2aivqL08ZFy7NPybNBKSkyn4oYNjA4g==\n'









