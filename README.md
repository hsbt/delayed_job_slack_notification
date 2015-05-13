# DelayedJobSlackNotification

Simple job count notification on slack

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'delayed_job_slack_notification'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install delayed_job_slack_notification

## Usage

You need to put following configuration to ```config/initializers/delayed_job_slack_notification.rb```

```ruby
DelayedJobSlackNotification.webhook_url = "https://hooks.slack.com/services/your/hook"
DelayedJobSlackNotification.channel = "#general"
DelayedJobSlackNotification.username = "Delayed Job"
```

and run ```rake job:notification```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/hsbt/delayed_job_slack_notification/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
