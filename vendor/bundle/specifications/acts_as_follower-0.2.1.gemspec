# -*- encoding: utf-8 -*-
# stub: acts_as_follower 0.2.1 ruby lib

Gem::Specification.new do |s|
  s.name = "acts_as_follower"
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Tom Cocca"]
  s.date = "2013-12-05"
  s.description = "acts_as_follower is a Rubygem to allow any model to follow any other model. This is accomplished through a double polymorphic relationship on the Follow model. There is also built in support for blocking/un-blocking follow records. Main uses would be for Users to follow other Users or for Users to follow Books, etc\u{2026} (Basically, to develop the type of follow system that GitHub has)"
  s.email = ["tom dot cocca at gmail dot com"]
  s.homepage = "https://github.com/tcocca/acts_as_follower"
  s.licenses = ["MIT"]
  s.rubyforge_project = "acts_as_follower"
  s.rubygems_version = "2.4.6"
  s.summary = "A Rubygem to add Follow functionality for ActiveRecord models"

  s.installed_by_version = "2.4.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
      s.add_development_dependency(%q<shoulda_create>, [">= 0"])
      s.add_development_dependency(%q<shoulda>, [">= 3.5.0"])
      s.add_development_dependency(%q<factory_girl>, [">= 4.2.0"])
      s.add_development_dependency(%q<rails>, ["~> 4.0.0"])
    else
      s.add_dependency(%q<sqlite3>, [">= 0"])
      s.add_dependency(%q<shoulda_create>, [">= 0"])
      s.add_dependency(%q<shoulda>, [">= 3.5.0"])
      s.add_dependency(%q<factory_girl>, [">= 4.2.0"])
      s.add_dependency(%q<rails>, ["~> 4.0.0"])
    end
  else
    s.add_dependency(%q<sqlite3>, [">= 0"])
    s.add_dependency(%q<shoulda_create>, [">= 0"])
    s.add_dependency(%q<shoulda>, [">= 3.5.0"])
    s.add_dependency(%q<factory_girl>, [">= 4.2.0"])
    s.add_dependency(%q<rails>, ["~> 4.0.0"])
  end
end
