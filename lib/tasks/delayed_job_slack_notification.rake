require 'delayed_job_active_record'
require 'net/http'
require 'json'

desc 'DJ のジョブが貯まっていたら slack で通知する'
task notify_delayed_job_count: :environment do
  pending_jobs = Delayed::Job.where(:attempts => 0, :locked_at => nil).count

  if pending_jobs >= 20
    alert = "[WARN] ジョブが #{pending_jobs} 件残っているようです"
    alert.gsub!(/WARN/, 'CRIT') if pending_jobs >= 50

    uri = URI.parse(DelayedJobSlackNotification.webhook_url)
    params = {'payload' => {"channel" => DelayedJobSlackNotification.channel, "username" => DelayedJobSlackNotification.username, "text" => alert}.to_json}
    Net::HTTP.post_form(uri, params)
  end
end
