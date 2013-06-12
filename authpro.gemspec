$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "authpro/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "authpro"
  s.version     = Authpro::VERSION
  s.authors     = ["Richard Nyström"]
  s.email       = ["ricny046@gmail.com"]
  s.homepage    = "https://github.com/ricn/authpro"
  s.summary     = "Simple Rails authentication generator for pros"
  s.description = "Simple Rails authentication generator for pros"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0.rc2"
  s.add_dependency "bcrypt-ruby", "~> 3.0.0"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "capybara"
  s.add_development_dependency "database_cleaner", "~> 1.0.1"
  s.add_development_dependency "timecop"
  s.add_development_dependency "turn"
end
