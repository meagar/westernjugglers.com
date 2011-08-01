# Load the rails application
require File.expand_path('../application', __FILE__)

Sass::Plugin.options[:always_check] = true
Sass::Plugin.options[:always_update] = true

# Initialize the rails application
WesternjugglersCom::Application.initialize!
