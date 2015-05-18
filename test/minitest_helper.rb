$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'rake'
require 'delayed_job_slack_notification'
load 'tasks/delayed_job_slack_notification.rake'

require 'minitest/autorun'
