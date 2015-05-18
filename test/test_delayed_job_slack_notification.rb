require 'minitest_helper'

class TestDelayedJobSlackNotification < Minitest::Test
  def setup
    DelayedJobSlackNotification.webhook_url = "https://example.com/hook"
  end

  def test_that_it_has_a_version_number
    refute_nil ::DelayedJobSlackNotification::VERSION
  end

  def test_notification_with_warning
    21.times do
      Delayed::Job.create!(:handler => :dummy)
    end

    stub_request(:post, "https://example.com/hook").
      with(:body => {"payload"=>"{\"channel\":null,\"username\":null,\"text\":\"[WARN] ジョブが 21 件残っているようです。\",\"icon_emoji\":\":warning:\"}"})

    Rake::Task['jobs:notification'].invoke
  end

  def test_notification_with_critical
    51.times do
      Delayed::Job.create!(:handler => :dummy)
    end

    stub_request(:post, "https://example.com/hook").
      with(:body => {"payload"=>"{\"channel\":null,\"username\":null,\"text\":\"[CRIT] ジョブが 51 件残っています。ワーカーの状況を確認してください。\",\"icon_emoji\":\":critical:\"}"})

    Rake::Task['jobs:notification'].invoke
  end
end
