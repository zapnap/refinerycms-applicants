# Applicants engine for Refinery CMS

## About

Adds a lightweight applicant management engine to your Refinery-based site.
Visitors can apply to be part of your program, exhibit at your event, etc by
filling out a form. You can add and edit questions for the form and manage
visitor submissions via the Refinery admin interface.


## Requirements

[Refinery CMS](http://refinerycms.com) version 1.0.x. This plugin does _not_
work with Refinery 2.x. Sorry. It's extracted from a couple older Refinery sites
that are still being maintained. Pull requests welcome if someone wants to
modernize it :).


## Installation

Include the latest [gem](http://rubygems.org/gems/refinerycms-applicants) into your
Refinery CMS application's Gemfile:

```ruby
gem "refinerycms-applicants"
```

Then run the following commands to install the Gem and migrate your database:

    bundle install
    rails generate refinerycms_applicants
    rake db:migrate

