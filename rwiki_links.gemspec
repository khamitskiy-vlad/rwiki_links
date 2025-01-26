# frozen_string_literal: true

require_relative "lib/rwiki_links/version"

Gem::Specification.new do |spec|
  spec.name = "rwiki_links"
  spec.version = RwikiLinks::VERSION
  spec.authors = ["Khamitskiy Vladislav"]
  spec.email = ["vladislaviktorovic@gmail.com"]

  spec.summary = "A gem for generating Wikipedia citation links."
  spec.description = "This gem helps generate citation links for Wikipedia in the cite web format."
  spec.homepage = "https://github.com/khamitskiy-vlad/rwiki_links#readme"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/khamitskiy-vlad/rwiki_links"
  spec.metadata["changelog_uri"] = "https://github.com/khamitskiy-vlad/rwiki_links/blob/main/CHANGELOG.md"
  spec.metadata["keywords"] = "wikipedia, wiki, citation, cite-web, ruby, gem, link"

  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri", "~> 1.15"
end
