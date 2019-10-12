lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "todo_lists/version"

Gem::Specification.new do |spec|
  spec.name          = "todo_lists"
  spec.version       = TodoLists::VERSION
  spec.authors       = ["Aurangzaib"]
  spec.email         = ["aurangzaib.danial@gmail.com"]

  spec.summary       = "Quickly make todo lists using terminal"
  spec.description   = "Allow users to be able to make todo lists without moving away from terminal, all the lists are persisted to database. \nYou need to have sqlite installed on your computer before hand http://www.sqlite.org"
  spec.homepage      = "https://github.com/aurangzaib-danial/todo_lists"
  spec.license       = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/aurangzaib-danial/todo_lists"
  spec.metadata["changelog_uri"] = "https://github.com/aurangzaib-danial/todo_lists"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0.12.2"
  spec.add_development_dependency "sinatra-activerecord", "2.0.14"
  spec.add_dependency "activerecord", "~> 5.2"
  spec.add_dependency "sqlite3", "1.4.1"
end
