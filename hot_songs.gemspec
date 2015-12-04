# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hot_songs/version'

Gem::Specification.new do |spec|
  spec.name          = "hot_songs"
  spec.version       = HotSongs::VERSION
  spec.authors       = ["KhalilC"]
  spec.email         = ["klcrumpler@gmail.com"]

  spec.summary       = %q{Retrive popular songs for user specifed genre}
  spec.description   = %q{Retrieves most popular artist and song data from Billboard.}
  spec.homepage      = "https://github.com/KhalilC/hot-songs-cli-gem"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib", "lib/hot_songs"]

  spec.add_development_dependency 'nokogiri'
  spec.add_development_dependency 'rspec' 
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'pry'
end
