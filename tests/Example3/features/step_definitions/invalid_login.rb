$validUserName = "" # Global variable to store valid username once generated

#--------------------------------------------------------------------------------------------------------

Given(/^I access the main login page$/) do  
  # Call common code method to access the login page
  AccessLoginPage()
end

When(/^I enter the invalid username "([^"]*)" and valid password "([^"]*)"$/) do |userName, userPassword|
  
  # Call the common code method to fill in user name and password fields with the passed in parameters
  LoginPageSignIn(userName, userPassword)
end

Then(/^login is not permitted$/) do
  # Check the screen/message is displayed for an unknown user
  expect(page.body).to match('Unknown User')
end

When(/^I enter a valid username and the invalid password "([^"]*)"$/) do |invalidPassword|

  # Call the common code method to fill in user name and password fields with the passed in parameters
  LoginPageSignIn($validUserName, invalidPassword)
end

Given(/^I generate a new user account$/) do
 
    # Create hash and generate new user id and password
  $data = {}
  $data['user_name'] = 'User' + Time.new().to_i.to_s + '@example.org' # Create a random user name
  $data['user_password'] = 'password'
  
  # Pass the created user to the rest API
  rest_post_call('http://localhost:4567/add_user', $data)
  
  # Gather the valid user name and store in global variable for use in login
  $validUserName = $data['user_name']
end