$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "blokkade/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "blokkade"
  spec.version     = Blokkade::VERSION
  spec.authors     = ["Aske Hansen"]
  spec.email       = ["aske@deeco.dk"]
  spec.homepage    = "https://www.deeco.dk"
  spec.summary     = "Add Blokks to your rails app"
  spec.description = "Compose unique pages defining custom Blokks"
  spec.license     = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.0.3", ">= 6.0.3.2"

  spec.add_development_dependency "pg"
  spec.add_development_dependency "slim"
end
