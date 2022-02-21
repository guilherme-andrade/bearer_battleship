source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.5'

gem 'rails', '~> 6.1.4', '>= 6.1.4.6'
gem 'puma', '~> 5.0'
gem 'webpacker', '~> 6.0.0.rc.2'
gem 'turbolinks', '~> 5'
gem 'nokogiri', '~> 1.8', platforms: :ruby
gem 'dry-initializer'
gem 'dry-types'
gem 'view_component'
gem 'view_component-contrib'
gem 'view_component_storybook'
gem 'stimulus_reflex', '~> 3.4'
gem 'view_component_reflex'
gem 'inline_svg'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara'
  gem 'rspec-rails', '~> 5.0.0'
  gem 'webdrivers'
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'spring'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
