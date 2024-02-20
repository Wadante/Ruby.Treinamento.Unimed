require 'capybara/cucumber'
require 'selenium-webdriver'
require 'capybara/dsl'
require 'faker'
require 'site_prism'
require 'rspec'
require_relative 'helper.rb'

$AMBIENTES = ENV['AMBIENTE']

CONFIG = YAML.load_file(File.dirname(__FILE__) + "/ambientes/#{$AMBIENTES}.yml")

World(Helper)

Capybara.configure do |config|
  puts  CONFIG
  config.default_driver = :selenium_chrome #selenium #selenium_chrome_headless
  config.app_host = CONFIG["url_padrao"]
end

Capybara.current_session.driver.browser.manage.window.maximize
