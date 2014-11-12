# -*- encoding: utf-8 -*-
# stub: rspec-activemodel-mocks 1.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "rspec-activemodel-mocks"
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["David Chelimsky", "Andy Lindeman", "Thomas Holmes"]
  s.date = "2014-06-02"
  s.description = "RSpec test doubles for ActiveModel and ActiveRecord"
  s.email = "rspec@googlegroups.com"
  s.homepage = "http://github.com/thomas-holmes/rspec-activemodel-mocks"
  s.licenses = ["MIT"]
  s.rdoc_options = ["--charset=UTF-8"]
  s.rubyforge_project = "rspec"
  s.rubygems_version = "2.2.2"
  s.summary = "rspec-activemodel-mocks-1.0.1"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 3.0"])
      s.add_runtime_dependency(%q<activemodel>, [">= 3.0"])
      s.add_runtime_dependency(%q<rspec-mocks>, ["< 4.0", ">= 2.99"])
      s.add_development_dependency(%q<rake>, ["~> 10.0.0"])
      s.add_development_dependency(%q<cucumber>, ["~> 1.3.5"])
      s.add_development_dependency(%q<aruba>, ["~> 0.4.11"])
      s.add_development_dependency(%q<ZenTest>, ["~> 4.9.5"])
      s.add_development_dependency(%q<activerecord>, [">= 3.0"])
    else
      s.add_dependency(%q<activesupport>, [">= 3.0"])
      s.add_dependency(%q<activemodel>, [">= 3.0"])
      s.add_dependency(%q<rspec-mocks>, ["< 4.0", ">= 2.99"])
      s.add_dependency(%q<rake>, ["~> 10.0.0"])
      s.add_dependency(%q<cucumber>, ["~> 1.3.5"])
      s.add_dependency(%q<aruba>, ["~> 0.4.11"])
      s.add_dependency(%q<ZenTest>, ["~> 4.9.5"])
      s.add_dependency(%q<activerecord>, [">= 3.0"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 3.0"])
    s.add_dependency(%q<activemodel>, [">= 3.0"])
    s.add_dependency(%q<rspec-mocks>, ["< 4.0", ">= 2.99"])
    s.add_dependency(%q<rake>, ["~> 10.0.0"])
    s.add_dependency(%q<cucumber>, ["~> 1.3.5"])
    s.add_dependency(%q<aruba>, ["~> 0.4.11"])
    s.add_dependency(%q<ZenTest>, ["~> 4.9.5"])
    s.add_dependency(%q<activerecord>, [">= 3.0"])
  end
end
