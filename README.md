## Active Model Basics Testing [![Build Status](https://travis-ci.org/nickmeehan/active_model_basics_testing.png)](https://travis-ci.org/nickmeehan/active_model_basics_testing)

This repo is to test the functionality of the newest release of Active Model for Rails 4.2.0.beta1.

Steps to get set-up:

1. `$ bundle install`
2. run `$ rake test`, all the tests should pass
3. if you receive the following error:
    ```
    You have already activated activesupport 4.1.1, but your Gemfile requires activesupport 4.2.0.alpha. Prepending `bundle exec` to your command may solve this. (Gem::LoadError)
    ```
  just run `$ bundle exec rake test`, as suggested

If you'd like to run tests individually:

1. run `$ rake test TEST=path_to_test`, e.g. `$ rake test TEST=test/models/person_test.rb`
2. if you receive the following error:
    ```
    You have already activated activesupport 4.1.1, but your Gemfile requires activesupport 4.2.0.alpha. Prepending `bundle exec` to your command may solve this. (Gem::LoadError)
    ```
  just run `$ bundle exec rake test TEST=path_to_test`, as suggested, e.g. `$ bundle exec rake test TEST=test/models/person_test.rb`