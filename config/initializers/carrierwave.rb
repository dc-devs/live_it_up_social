CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                                                             # required
    :aws_access_key_id      => 'AKIAIS65L4ERMNJJZZUQ',                                            # required
    :aws_secret_access_key  => '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',                        # required
    :region                 => 'us-west-1',                                                       # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'liveitupsocial'                                                         # required
  config.fog_public     = false                                                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}                                  # optional, defaults to {}
end