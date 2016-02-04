$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'shoulda/matchers'
require 'rocket_pays_rails_api'

require 'support/shoulda_matchers'
require "codeclimate-test-reporter"
CodeClimate::TestReporter.start
