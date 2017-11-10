if Rails.env.production? || Rails.env.staging? || Rails.env.development?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
        provider: 'AWS',
        aws_access_key_id: ENV['aws_access_id'],
        aws_secret_access_key: ENV['aws_access_key'],
        region: 'us-east-1'
    }
    config.fog_directory  = ENV['aws_bucket']
    config.fog_public     = false
    config.fog_authenticated_url_expiration = 604799 # Increase expired time to 2 weeks
    config.fog_attributes = { cache_control: "public, max-age=#{365.day.to_i}" }
  end
end