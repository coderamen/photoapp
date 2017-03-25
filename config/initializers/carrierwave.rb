
# require 'carrierwave/orm/activerecord'

# require 'carrierwave/storage/fog'
  CarrierWave.configure do |config|
    config.root = Rails.root.join('tmp')
    config.cache_dir = 'carrierwave'
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['S3_ACCESS_KEY'],
      aws_secret_access_key: ENV['S3_SECRET_KEY'],
      region: 'ap-southeast-1'
    }
    # config.fog_use_ssl_for_aws = false
    # config.storage             = :fog
    config.fog_directory       = ENV['S3_BUCKET']
  end
