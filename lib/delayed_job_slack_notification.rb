require "delayed_job_slack_notification/version"

require 'slack-notifier'
require 'active_support/all'

module DelayedJobSlackNotification
  mattr_accessor :webhook_url, :channel, :username

  module_function

  def notifier
    @@_notifier ||= Slack::Notifier.new(webhook_url, channel: channel, username: username)
  end
end

require "delayed_job_slack_notification/railtie" if defined?(Rails)
