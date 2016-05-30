require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module Protospace
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
    # 日本時刻の設定
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
  end
end
