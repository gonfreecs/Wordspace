# -*- encoding: utf-8 -*-
# stub: redactor-rails 0.5.0 ruby lib

Gem::Specification.new do |s|
  s.name = "redactor-rails"
  s.version = "0.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Sammy"]
  s.date = "2015-02-24"
  s.description = "The redactor-rails gem integrates the Redactor editor"
  s.email = ["sammylintw@gmail.com"]
  s.homepage = "https://github.com/sammylin/redactor-rails"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.6"
  s.summary = ""

  s.installed_by_version = "2.4.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mime-types>, [">= 0"])
      s.add_runtime_dependency(%q<orm_adapter>, [">= 0"])
      s.add_runtime_dependency(%q<devise>, [">= 0"])
    else
      s.add_dependency(%q<mime-types>, [">= 0"])
      s.add_dependency(%q<orm_adapter>, [">= 0"])
      s.add_dependency(%q<devise>, [">= 0"])
    end
  else
    s.add_dependency(%q<mime-types>, [">= 0"])
    s.add_dependency(%q<orm_adapter>, [">= 0"])
    s.add_dependency(%q<devise>, [">= 0"])
  end
end
