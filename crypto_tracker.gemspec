# frozen_string_literal: true

require_relative "lib/crypto_tracker/version"

Gem::Specification.new do |spec|
  spec.name = "crypto_tracker"
  spec.version = CryptoTracker::VERSION
  spec.authors = ["Davide Almeida"]
  spec.email = ["davide.jhonatan@gmail.com"]

  spec.summary = "Gem para obter preços e histórico de criptomoedas."
  spec.description = "Permite consultar o preço atual e histórico de diferentes criptomoedas em BRL e USD."
  spec.homepage = "https://www.davidealmeida.com.br"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/davide-almeida/crypto_tracker"
  spec.metadata["changelog_uri"] = "https://github.com/davide-almeida/crypto_tracker"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
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

  spec.add_dependency "faraday", "~> 2.12"
  spec.add_dependency "json"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
