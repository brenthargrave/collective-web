source 'https://rubygems.org'

gem 'middleman', '>= 4.0.0'
gem 'middleman-livereload'
gem "middleman-blog", "~> 4.0"
gem "builder"
gem "foreman"
gem "slim"
gem "middleman-inliner",
  github: "jayliu50/middleman-inliner"
gem "middleman-sprockets", "~> 4.0.0.rc"
gem 'redcarpet'

# NOTE: MMv4 support in development:
# https://github.com/middleman-contrib/middleman-deploy/pull/87
gem 'middleman-deploy', '~> 2.0.0.pre.alpha'

source 'https://rails-assets.org' do
  %w{
    jquery
    jquery-externalize
  }.each do |lib|
    gem "rails-assets-#{lib}"
  end
end

