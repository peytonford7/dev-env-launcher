# frozen_string_literal: true
require "rails"

class App < Rails::Application
  config.eager_load = false
  config.secret_key_base = "dev-env-launcher-secret"

  routes.append do
    root to: proc { [200, { "Content-Type" => "text/plain" }, ["Put Your Application Here!"]] }
  end
end

App.initialize!
run App
