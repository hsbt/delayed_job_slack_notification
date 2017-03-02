# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'delayed_job_slack_notification/version'

Gem::Specification.new do |spec|
  spec.name          = "delayed_job_slack_notification"
  spec.version       = DelayedJobSlackNotification::VERSION
  spec.authors       = ["SHIBATA Hiroshi"]
  spec.email         = ["hsbt@ruby-lang.org"]

  spec.summary       = %q{Slack notifier for pending jobs of Delayed Job.}
  spec.description   = %q{Slack notifier for pending jobs of Delayed Job.}
  spec.homepage      = "https://github.com/hsbt/delayed_job_slack_notification"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "delayed_job_active_record"
  spec.add_dependency "activesupport"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "sqlite3"
end
