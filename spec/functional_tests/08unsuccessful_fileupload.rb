

describe "UnsuccessfulFileupload" do

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
  
  it "test_unsuccessful_fileupload" do
    @driver.get(@base_url + "/")
    @driver.find_element(:id, "user_email").clear
    @driver.find_element(:id, "user_email").send_keys "sydney.vanda@yahoo.com"
    @driver.find_element(:id, "user_password").clear
    @driver.find_element(:id, "user_password").send_keys "testpassword"
    @driver.find_element(:name, "commit").click
    @driver.find_element(:link, "Upload New Image").click
    #@driver.find_element(:id, "asset_uploaded_file").clear
    @driver.find_element(:id, "asset_uploaded_file").send_keys "/Users/Sydney/Pictures/grandma_lucy_80th.pdf"
    @driver.find_element(:name, "commit").click
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
