module DelaydJobSlackNotification
  class Railtie < Rails::Railtie
    rake_tasks do
      load "tasks/delayed_job_slack_notification.rake"
    end
  end
end
