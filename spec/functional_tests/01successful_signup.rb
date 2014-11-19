#require "json"
#require "selenium-webdriver"
#require "rspec"
#include RSpec::Expectations

describe "SuccessfulSignup" do

  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @base_url = "http://localhost:3000/"
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end
  
  after(:each) do
    @driver.quit
    @verification_errors.should == []
  end
  
  it "test_successful_signup" do
    @driver.get(@base_url + "/")
    @driver.find_element(:id, "user_name").clear
    @driver.find_element(:id, "user_name").send_keys "Sydney"
    @driver.find_element(:css, "#regform > #new_user > div.form-group > #user_email").clear
    @driver.find_element(:css, "#regform > #new_user > div.form-group > #user_email").send_keys "sydney.vanda@yahoo.com"
    @driver.find_element(:css, "#regform > #new_user > div.form-group > #user_password").clear
    @driver.find_element(:css, "#regform > #new_user > div.form-group > #user_password").send_keys "testpassword"
    @driver.find_element(:id, "user_password_confirmation").clear
    @driver.find_element(:id, "user_password_confirmation").send_keys "testpassword"
    @driver.find_element(:css, "#regform > #new_user > input[name=\"commit\"]").click
    @driver.find_element(:link, "Sign out").click
  end
  
  def element_present?(how, what)
    @driver.find_element(how, what)
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end
  
  def alert_present?()
    @driver.switch_to.alert
    true
  rescue Selenium::WebDriver::Error::NoAlertPresentError
    false
  end
  
  def verify(&blk)
    yield
  rescue ExpectationNotMetError => ex
    @verification_errors << ex
  end
  
  def close_alert_and_get_its_text(how, what)
    alert = @driver.switch_to().alert()
    alert_text = alert.text
    if (@accept_next_alert) then
      alert.accept()
    else
      alert.dismiss()
    end
    alert_text
  ensure
    @accept_next_alert = true
  end
end
