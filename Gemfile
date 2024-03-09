source "https://rubygems.org"

ruby RUBY_VERSION

# Hello! This is where you manage which Jekyll version is used to run.
# When you want to use a different version, change it below, save the
# file and run `bundle install`. Run Jekyll with `bundle exec`, like so:
#
#     bundle exec jekyll serve
#
# This will help ensure the proper Jekyll version is running.
# Happy Jekylling!
gem "jekyll", "~> 3.9.3"

# If you want to use GitHub Pages, remove the "gem "jekyll"" above and
# uncomment the line below. To upgrade, run `bundle update github-pages`.
# gem "github-pages", group: :jekyll_plugins
# If you have any plugins, put them here!
group :jekyll_plugins do
  gem 'github-pages'
  #gem 'jekyll-feed'
  #gem 'jekyll-sitemap'
  #gem 'jekyll-seo-tag'
  #gem 'jekyll-gist'
  #gem 'jekyll-loading-lazy'
  #gem 'jekyll-webp'
  #gem 'jekyll-gzip'
  #gem 'jekyll-extlinks'
  #gem 'jekyll-remote-theme'
  #gem 'jekyll-github-metadata'    
end

# Windows and JRuby does not include zoneinfo files, so bundle the tzinfo-data gem
# and associated library.
platforms :mingw, :x64_mingw, :mswin, :jruby do
  gem "tzinfo", "~> 1.2"
  gem "tzinfo-data"
end

# Performance-booster for watching directories on Windows
gem "wdm", "~> 0.1.1", :platforms => [:mingw, :x64_mingw, :mswin]

# Fix for Load error: cannot load such file – webrick 
# (https://talk.jekyllrb.com/t/load-error-cannot-load-such-file-webrick/5417)
gem "webrick", "~> 1.7"
