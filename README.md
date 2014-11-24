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
- (install curl, nokogiri 1.6.3.1, nodejs, imagemagick and possibly others)
-  \curl -sSL https://get.rvm.io | bash -s stable (install RVM)
-  rvm install 2.1.3 (install ruby 2.1.3)
-  rvm use 2.1.3 (use Ruby version 2.1.3 compatible with this application)
-  bundle install (install dependiencies, resolve all install errors - use homebrew)
-  rails server (restarts and runs server)
-  go to web browser and type localhost:3000 and web application should load and run

Windows 8 does not seem to run ruby on rails applications correctly. We suggest setting up a virtual machine.

For Ubuntu Linux:
-  sudo apt-get update
-  sudo apt-get install curl
-  \curl -sSL https://get.rvm.io | bash -s stable
-  rvm install ruby-2.1.3
-  sudo apt-get install libxslt-dev libxml2-dev
-  gem install nokogiri -v '1.6.3.1' -- --use-system-libraries
-  sudo apt-get install libpq-dev
-  sudo apt-get install nodejs
-  sudo apt-get install imagemagick
-  bundle install
-  rake db:create
-  rake db:migrate
-  rails server
-  go to web browser and type localhost:3000 and web application should load and run


Running Unit Tests:
- gem install simplecov
- bundle install
- bundle exec rspec
- all unit tests are present inside of spec folder
- coverage report can be generated as folows:
	- cd coverage/
	- open index.html

Running Functional Tests: (using Selenium IDE and Rspec)
- cd spec/functional_tests 
- edit line 27 in the files 05successful_uploadAvatar.rb, 06unsuccessful_uploadAvatar.rb, 07successful_fileupload.rb, and 08unsuccessful_fileupload.rb
- update local path to test pictures (ie panda_cubs.jpg, Avatar_example.png, and README.md in the top layer of the repository)
- rspec spec/functional_tests/* (this should run all the functional tests that cover the requirements)

Bug Fixes:
1) If avatar uploades but does not display, try changing line
- before_filter :configure_permitted_parameters, if: :devise_controller?
- before_filter :configure_permitted_parameters#, if: :devise_controller?
in app/controllers/application_controller.rb
Make this change, refresh browser (do not restart server ie run rails server again), you should get an error. Then change 
back the line to the original without the # and refresh again and avatar should display.
Still investigating possible causes for this bug.
