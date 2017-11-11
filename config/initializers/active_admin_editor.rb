ActiveAdmin::Editor.configure do |config|
  config.s3_bucket = ENV['aws_bucket']
  config.aws_access_key_id = ENV['aws_access_id']
  config.aws_access_secret = ENV['aws_access_key']
  config.storage_dir = 'uploads'
end
