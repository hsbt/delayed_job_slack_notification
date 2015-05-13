require "delayed_job_slack_notification/version"

module DelayedJobSlackNotification
end

require "delayed_job_slack_notification/railtie" if defined?(Rails)
