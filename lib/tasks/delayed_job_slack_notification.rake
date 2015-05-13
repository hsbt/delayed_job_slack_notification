require 'delayed_job_active_record'
require 'net/http'
require 'json'

namespace :jobs do
  desc 'DJ のジョブが貯まっていたら slack で通知する'
  task notification: :environment do
    pending_jobs = Delayed::Job.where(:attempts => 0, :locked_at => nil).count

    if pending_jobs >= 50
      alert = "[CRIT] ジョブが #{pending_jobs} 件残っています。ワーカーの状況を確認してください。"
      icon = ":critical:"
      elsif pending_jobs >= 20
        alert = "[WARN] ジョブが #{pending_jobs} 件残っているようです。"
        icon = ":warning:"
    end

    if alert && icon
      uri = URI.parse(DelayedJobSlackNotification.webhook_url)
      params = {'payload' => {"channel" => DelayedJobSlackNotification.channel, "username" => DelayedJobSlackNotification.username, "text" => alert, "icon_emoji" => icon}.to_json}
      Net::HTTP.post_form(uri, params)
    end
  end
end
