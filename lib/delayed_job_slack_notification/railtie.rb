module DelaydJobSlackNotification
  class Railtie < Rails::Railtie
    rake_tasks do
      load "tasks/notify_delayed_job_count.rake"
    end
  end
end
