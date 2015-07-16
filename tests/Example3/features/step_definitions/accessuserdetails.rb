
# Global variables for use in form completion and check
# Values get entered into the form edit boxes
$firstName = "Matt"
$lastName = "Thomas"
$houseNo = "1"
$street= "High Street"
$city = "Newton Abbot"
$postCode = "TQ12 1CC"

$gender = "Female"    # Value selected from radio button
$car = "Audi"         # Value selected from dropdown list

$isWalking = false
$isCycling = true
$isSwimming = true
$walking = "walking"
$cycling = "cycling"
$swimming = "swimming"

#---------------------------------------------------------------------------------------------------------

Given(/^I have created an account, logged in and accessed the user details form$/) do
  
  # Create hash and generate new user id and password
  $data = {}
  $data['user_name'] = 'User' + Time.new().to_i.to_s + '@example.org' # Create a random user name
  $data['user_password'] = 'password'

  #print($data['user_name']) # To gather user id from intial run
  
  # Pass the created user to the rest API
  rest_post_call('http://localhost:4567/add_user', $data)
  
  # Visit main page and fill login details
  visit('http://localhost:4567')
  fill_in('username', :with => $data['user_name'])
  fill_in('password', :with => $data['user_password'])
  click_button('Sign in')
  
  # Confirm login complete
  expect(page.body).to match('Logged in')
  
  # Find hyperlink using the absolute XPath and click
  #find(:xpath, 'html/body/div[2]/ul/li[2]/a').click
  # Find hyperlink using the relative XPath and click
  #find(:xpath, '*//div[2]/ul/li[2]/a').click
  # Find the hyperlink using the link text
  click_link("Details form")
  
  
  # Check the correct page displayed
  page.has_content?('Please enter details')
end

When(/^I enter the user details$/) do
  # Complete all the edit fields
  fill_in('first-name', :with => $firstName)
  fill_in('second-name', :with => $lastName)
  fill_in('house-number', :with => $houseNo)
  fill_in('street', :with => $street)
  fill_in('city', :with => $city)
  fill_in('postcode', :with => $postCode)
  
  # Select one of the gender radio buttons
  find(:xpath, 'html/body/div[1]/form/input[8]').click
  
  # Choose the required activities
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
  select($car, :from => 'cars')
  
  # Click the submit button to submit entered details.
  click_button('Submit')
end

Then(/^the user details are displayed successfully$/) do

  page.has_content?('My awesome details are shown below')

  # Find name via xpath or should have
  #find(".//*[@id='name']/p").text.expect eq "My name is " + "Matt Thomas"
  #page.should have_content "Matt Thomas" # Doesn't like this and advises out of date command
  
  # Check name - via expect by using find the xpath
  expect(find(".//*[@id='name']/p")).to have_content "My name is #$firstName" # without xpath identifier
  # Check address - via expect page
  expect(page).to have_content "I Live at the following address #$houseNo #$street #$city #$postcode"
  # Check gender - via expect by using find the xpath
  expect(find(:xpath, ".//*[@id='gender']/p")).to have_content "I am " + "#$gender".downcase # with xpath identifer
  # Check car - via expect and using id
  expect('car').to have_content "#$car".downcase
  
  # Check activities but only if they are meant to be there
  # Use the id to identify where the item should be if displayed and check content
  if $isWalking then
    expect($walking).to have_content $walking
  end
  
  if $isCycling then
    expect($cycling).to have_content $cycling
  end
  
  if $isSwimming then
    expect($swimming).to have_content $swimming
  end

end
