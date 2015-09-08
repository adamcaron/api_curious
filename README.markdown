[![Stories in Ready](https://badge.waffle.io/adamcaron/api_curious.svg?label=ready&title=Ready)](http://waffle.io/adamcaron/api_curious)

# API-Curious

This a project for the Turing School of Software & Design. This project's goal is to consume and work with data from a public API.

API-Curious is a simplified, reconstructed version of the Instagram (web) UI, built using the Instagram API.

API-Curious uses the Instagram API to build a basic version of the Instagram feed where users can
 - Authenticate with my Instagram account
 - See my basic profile information (username, profile pic)
 - View a list of recent posts from my feed
 - View photos for each post
 - View comments for each post
 - View like count for each post

API-Curious also works with the OAuth protocol to authenticate users with the third-party provider (in this case, Instagram), and uses various testing techniques to test against the Instagram's data.

You can check the full project description [here](https://github.com/turingschool/lesson_plans/blob/master/ruby_03-professional_rails_applications/apicurious.md#technical-expectations).


# Project Workflow


## Instructions

Run `git clone git@github.com:adamcaron/api_curious.git`

To create and initialize the database, run `rake db:setup`

Run `bundle install` to include dependencies.

Run `rails s` and access [http://localhost:3000](http://localhost:3000) in your browser.

To run the tests, run `bundle exec rspec`

