require 'delayed_job_active_record'

desc 'DJ のジョブが貯まっていたら ikachan で通知する'
task notify_delayed_job_count: :environment do
  pending_jobs = Delayed::Job.where(:attempts => 0, :locked_at => nil).count

  if pending_jobs >= 20
    alert = "[WARN] ジョブが #{pending_jobs} 件残っているようです"
    alert.gsub!(/WARN/, 'CRIT') if pending_jobs >= 50
    Ikachan.notice(alert)
  end
end
