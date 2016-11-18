class RSA

  def initialize public_key, private_key, mixin, base
    @public_key = public_key.to_i(base)
    @private_key = private_key.to_i(base)
    @mixin = mixin.to_i(base)
    @base = base
  end

  def encrypt message
    raw = message.bytes.reverse!
    raw << raw.size
    strip_leading_zero_bytes raw
  end

  def strip_leading_zero_bytes a
    byteLength = a.size
    keep = 0
    (0...byteLength).each { |kp| a[kp] == 0? keep += 1 : break}
    intLength = ((byteLength - keep) + 3) >> 2
    result = []
    b = byteLength - 1;
    (intLength-1).downto(0).each do |i|
      result[i] = (a[b]) & 0xff
      b -= 1
      bytesRemaining = b - keep + 1;
      bytesToTransfer = 3 < bytesRemaining ? 3 : bytesRemaining
      j = 8
      while j <= bytesToTransfer << 3
        x = a[b]
        result[i] |= ((x & 0xff) << j)
        b -= 1
        j += 8
      end
    end
    result
  end

  #2 << 0 255
  # 5+ 104*(2<<7) + 101*(2 << 15) + 108*(2 <<23) + 108*(2<<31)+111*(2<<39)
  def modpow(base, exponent, modulus)
    result = 1
    while exponent > 0
      result   = (base * result) % modulus unless (exponent & 1).zero?
      base     = (base * base)   % modulus
      exponent >>= 1
    end
    result
  end

end


