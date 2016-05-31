$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rhombus_edi/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rhombus_edi"
  s.version     = RhombusEdi::VERSION
  s.authors     = ["Sumit Birla"]
  s.email       = ["sbirla@tampahost.net"]
  s.homepage    = "https://github.com/sumitbirla/rhombud_edi"
  s.summary     = "Summary of RhombusEdi."
  s.description = "Library to deal with EDI transactions (document transfers and notifications)"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.6"
end
