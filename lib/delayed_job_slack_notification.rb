require "delayed_job_slack_notification/version"

require 'delayed_job_active_record'
require 'active_support/all'

module DelayedJobSlackNotification
  mattr_accessor :webhook_url, :channel, :username
end

require "delayed_job_slack_notification/railtie" if defined?(Rails)
