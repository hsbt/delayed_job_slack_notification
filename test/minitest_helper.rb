$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'minitest/autorun'
require 'webmock/minitest'

require 'rake'
require 'delayed_job_slack_notification'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')
require 'generators/delayed_job/templates/migration'
ActiveRecord::Schema.define do
  CreateDelayedJobs.up
end

task :environment do
# dummy
end

load 'tasks/delayed_job_slack_notification.rake'
