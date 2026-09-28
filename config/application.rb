require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Myapp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.2

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # 日本語をデフォルトにする
    config.i18n.default_locale = :ja

    # タイムゾーンは日本時間をデフォルトにする
    config.time_zone = "Tokyo"

    # Don't generate system test files.
    config.generators.system_tests = nil
    # 不要なファイルが生成されるのを防ぎ、開発効率を向上させる
    config.generators do |g|
      # ルーティングの記述を加えないようにする
      g.skip_routes true
      # ヘルパーファイルを自動生成しないようにする
      g.helper false
      # テストフレームワークを使わないようにする
      g.test_framework nil
    end
  end
end
