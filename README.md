Image storing and enhancing web service named "Picture Bright"

Functionality included:
- User sign up and registration to server (valid email and password required)
- Secure password encryption and account validation upon sign in
- User will remain logged in until they click log out
- User avatar(profile image) and name to accompany user profile which is displayed while user is logged in
- Easy website naviagtion / intuitive webpage design
- User can upload pictures in an acceptible file format and load them to their account
- Uploaded pictures can be edited : functionality includes brightness, as well as other functions included in CanmanJS library

Getting Started:

To run web application:

For Mac OS:
1) (install curl, nokogiri 1.6.3.1, nodejs, imagemagick and possibly others)
2) \curl -sSL https://get.rvm.io | bash -s stable (install RVM)
3) rvm install 2.1.3 (install ruby 2.1.3)
4) rvm use 2.1.3 (use Ruby version 2.1.3 compatible with this application)
5) bundle install (install dependiencies, resolve all install errors - use homebrew)
6) rails server (restarts and runs server)
7) go to web browser and type localhost:3000 and web application should load and run

Windows 8 does not seem to run ruby on rails applications correctly. We suggest setting up a virtual machine.

For Ubuntu Linux:
1) sudo apt-get update
2) sudo apt-get install curl
3) \curl -sSL https://get.rvm.io | bash -s stable
4) rvm install ruby-2.1.3
5) sudo apt-get install libxslt-dev libxml2-dev
6) gem install nokogiri -v '1.6.3.1' -- --use-system-libraries
7) sudo apt-get install libpq-dev
8) sudo apt-get install nodejs
9) sudo apt-get install imagemagick
10) bundle install
11) rake db:create
12) rake db:migrate
13) rails server
14) go to web browser and type localhost:3000 and web application should load and run



Bug Fixes:
1) If avatar uploades but does not display, try changing line  
	before_filter :configure_permitted_parameters, if: :devise_controller?
        before_filter :configure_permitted_parameters#, if: :devise_controller?
in app/controllers/application_controller.rb
Make this change, refresh browser (do not restart server ie run rails server again), you should get an error. Then change 
back the line to the original without the # and refresh again and avatar should display.
Still investigating possible causes for this bug.
