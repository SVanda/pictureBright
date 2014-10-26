### README
This is the skeleton for image hosting and editing app called ImageSpace. You can name your project anything you want.

To continue your project on top of this, clone this code and do following.

## To setup project

* Install RVM (http://rvm.io/)

* Install ruby by `rvm install ruby 2.0`

* do `rvm use 2.0`

* Install dependencies by `bundle install`

* Run server with `rails server`

* Go to your web browser and open "http://localhost:3000"

* You are ready to roll :)


*The UI is built with twitter bootstrap, less and jquery*


The home page does nothing other than taking email and password. If you click on the 'sign in' you will be taken to the same home page.


## To run sample unit test

* run `bundle exec rake test`

The source file for test is at test folder.

## To run sample functional test

*run `bundle exe rake cucumber`

*The functional test is written on Cucumber steps with Selenium driver and Capybara. You can see the tests at features folder*