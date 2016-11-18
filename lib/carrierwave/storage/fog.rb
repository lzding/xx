CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
      provider:              'AWS',                        # required
      aws_access_key_id:     'AKIAIKDZIM4NEGXPQUJQ',                        # required
      aws_secret_access_key: '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',                        # required
      region:                'ap-southeast-1'                  # optional, defaults to 'us-east-1'
      # host:                  's3.example.com',             # optional, defaults to nil
      # endpoint:              'milephoto.s3-website-ap-southeast-1.amazonaws.com' # optional, defaults to nil
  }
  config.fog_directory  = 'milephoto'                          # required
  config.fog_public     = false                                        # optional, defaults to true
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
end