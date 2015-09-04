
# Global variables for use in form completion and check
# Values entered into the form edit boxes....
$firstName = "Matt"
$lastName = "Thomas"
$houseNo = "1"
$street= "High Street"
$city = "Newton Abbot"
$postcode = "" # Now populated in code by passed in parameter

$gender = ""    # Value selected from radio button, populated by passed in parameter
$carMake = ""     # Value selected from dropdown list, populated by passed in parameter
$defaultGender = "Male" # Default value selected from radio button
$defaultCarMake = "Volvo" # Default value selected from dropdown list

# The activites to be added to the form (true) or not (false)
$isWalking = false
$isCycling = true
$isSwimming = true
# And the activites text displayed on the user details confirmation
$walking = "walking"
$cycling = "cycling"
$swimming = "swimming"

#---------------------------------------------------------------------------------------------------------

Given(/^I have created an account, logged in and accessed the user details form$/) do
  
  # Create hash and generate new user id and password
  $data = {}
  $data['user_name'] = 'User' + Time.new().to_i.to_s + '@example.org' # Create a random user name
  $data['user_password'] = 'password'
  
  # Pass the created user to the rest API
  rest_post_call('http://localhost:4567/add_user', $data)
  
  # Call common code methods to access the main page and login
  AccessLoginPage()
  LoginPageSignIn($data['user_name'], $data['user_password'])
  
  # Log the user id in the terminal
  print("Logged in as....")
  print($data['user_name'])
  
  # Confirm login complete
  expect(page.body).to match('Logged in')
  
  # Find and click the hyperlink using the link text
  click_link("Details form")
  
  # Check the correct page displayed (user details)
  page.has_content?('Please enter details')
end


When(/^I enter the user details including "([^"]*)" "([^"]*)" driver from postcode "([^"]*)"$/) do |pGender, pCarMake, pPostcode|
  
  # Add parameter values to global variables to also use in 'Then' method to check
  # displayed values.
  $gender = pGender
  $carMake = pCarMake
  $postcode = pPostcode
  
  # Complete all the edit fields passing in the variabke values
  fill_in('first-name', :with => $firstName)
  fill_in('second-name', :with => $lastName)
  fill_in('house-number', :with => $houseNo)
  fill_in('street', :with => $street)
  fill_in('city', :with => $city)
  fill_in('postcode', :with => $postcode)
  
  # Select one of the gender radio buttons
  # Depending on the gender required, the XPath is different
  if $gender.downcase == 'male' then
    # Gender is male so locate female radio button using XPath and click
    find(:xpath, 'html/body/div[1]/form/input[7]').click
  else
    # Gender is female so locate male radio button using XPath and click
    find(:xpath, 'html/body/div[1]/form/input[8]').click
  end
  
  # Choose the required activities
  # Only select the check box if the activity is required
  if $isWalking then
    check($walking)
  end
  if $isCycling then
    check($cycling) 
  end  
  if $isSwimming then
    check($swimming)
  end
  
  # Select a car manufacturer from the dropdown list
  select($carMake, :from => 'cars')
  
  # Click the submit button to submit entered details.
  click_button('Submit')
end


Then(/^the user details are displayed successfully$/) do

  # Check the correct page is displayed by checking the page content for the 
  # page description text. (My awesome details.... etc)
  page.has_content?('My awesome details are shown below')
  
  # Check inputted name displayed in the 'name' field using XPath
  expect(find(".//*[@id='name']/p")).to have_content "My name is #$firstName" # without xpath identifier
  
  # Check inputted address details are displayed
  # House number found by id, but other fields found in page.body
  expect(find_by_id('house_number')).to have_content $houseNo
  expect(find_by_id('street')).to have_content $street 
  expect(find_by_id('city')).to have_content $city 
  expect(find_by_id('postcode')).to have_content $postcode
  
  # Check selected gender displayed in the 'gender' field using XPath
  expect(find(:xpath, ".//*[@id='gender']/p")).to have_content "I am " + "#$gender".downcase # with xpath identifer
  # Check selected car make is displayed in the 'car' field.
  # Cannot find by id, both the div and p elements have the id 'car'
  # will search page.body instead for the value.
  expect(page.body).to have_content "#$carMake".downcase
  
  # Check whether the selected activities are displayed.
  # Alternatively check that non-selected activities are not displayed.
  if $isWalking then
    # Walking has been selected, find the field by id and check expected value
    expect(find_by_id('walking')).to have_content $walking
  else
    # Walking was not selected so check 'walking' not displayed
    # Cannot find by id as element is null so will search page.body instead
    expect(page.body).to have_no_content $walking
  end
  
  if $isCycling then
    # Cycling has been selected, find the field using its XPath and check expected value
    # XPath used as field does not have a unique id.
    expect(find(:xpath, ".//*[@id='hobbies']/p[2]")).to have_content $cycling
  else
    # Cycling was not selected so check 'cycling' not displayed in page.body
    expect(page.body).to have_no_content $cycling
  end
    
  if $isSwimming then
    # Swimming has been selected, check page.body for the expected value
    expect(page.body).to have_content $swimming
  else
    # Swimming was not selected so check 'swimming' not displayed in page.body
    expect(page.body).to have_no_content $swimming
  end

end


When(/^I enter no user details$/) do
  # No user details are entered, just use the default values/blank fields
  # Click the submit button to submit the details
  click_button('Submit')
end


Then(/^the default user details are displayed successfully$/) do 
  
  # Check a blank name is displayed, just the accompanying pre text
  expect(find(".//*[@id='name']/p")).to have_content "My name is" 
  
  # Address fields will not be present on the page
  # Id's not present on the page, so check that none of the address is present on the page
  # as none were entered onto the previous input form 
  expect(page.body).to have_no_content $houseNo
  expect(page.body).to have_no_content $street
  expect(page.body).to have_no_content $city
  expect(page.body).to have_no_content $postcode
  
  # Check the default gender 'male' is displayed
  expect(find(:xpath, ".//*[@id='gender']/p")).to have_content "I am " + "#$defaultGender".downcase
  
  # Check the default car manufacturer (volvo) is displayed
  expect(page.body).to have_content "#$defaultCarMake".downcase
  
  # Check that none of the activites are displayed on screen
  expect(page.body).to have_no_content $walking
  expect(page.body).to have_no_content $cycling
  expect(page.body).to have_no_content $swimming
end
