# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{hash-path}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["maiha"]
  s.date = %q{2010-01-12}
  s.description = %q{path accessor to hierarchical hash}
  s.email = %q{maiha@wota.jp}
  s.extra_rdoc_files = ["README", "MIT-LICENSE"]
  s.files = ["MIT-LICENSE", "README", "Rakefile", "lib/hash-path.rb", "spec/inherit_spec.rb", "spec/api_spec.rb", "spec/its_helper.rb", "spec/spec_helper.rb"]
  s.homepage = %q{http://github.com/maiha/hash-path}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{asakusarb}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{path accessor to hierarchical hash}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
