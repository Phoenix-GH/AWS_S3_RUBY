CarrierWave.configure do |config|
  config.dropbox_app_key = Rails.application.secrets[:dropbox]['app_key']
  config.dropbox_app_secret = Rails.application.secrets[:dropbox]['app_secret']
  config.dropbox_access_token = Rails.application.secrets[:dropbox]['access_token']
  config.dropbox_access_token_secret = Rails.application.secrets[:dropbox]['access_token_secret']
  config.dropbox_user_id = Rails.application.secrets[:dropbox]['user_id']
  config.dropbox_access_type = Rails.application.secrets[:dropbox]['mode']
end
