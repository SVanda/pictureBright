Given(/^I am a new user$/) do
  #logout user
end

Given(/^I load the home page$/) do
  visit "http://localhost:3000" 
end

Given(/^I fill in "(.*?)" with "(.*?)"$/) do |field, value|
  fill_in(field, :with => value)
end

When(/^I press "(.*?)"$/) do |button|
  click_button(button) 
end

Then(/^the same home page is loaded$/) do
  page.should have_content("ImageSpace")  
end
