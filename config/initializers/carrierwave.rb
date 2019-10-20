# frozen_string_literal: true

CarrierWave.configure do |config|
  config.permissions = 0o666
  config.directory_permissions = 0o777
  if Rails.env.production?
    config.storage    = :aws
    config.aws_bucket = Rails.application.credentials.aws[:bucket]
    config.aws_acl    = 'private'

    # The maximum period for authenticated_urls is only 7 days.
    config.aws_authenticated_url_expiration = 60 * 60 * 24 * 7

    # Set custom options such as cache control to leverage browser caching.
    # You can use either a static Hash or a Proc.
    config.aws_attributes = lambda {
      {
        expires: 1.week.from_now.httpdate,
        cache_control: 'max-age=604800'
      }
    }

    config.aws_credentials = {
      access_key_id: Rails.application.credentials.aws[:access_key_id],
      secret_access_key: Rails.application.credentials.aws[:secret_access_key],
      region: 'us-west-2'
    }
  else
    config.storage = :file
  end

  config.asset_host = ActionController::Base.asset_host
end
