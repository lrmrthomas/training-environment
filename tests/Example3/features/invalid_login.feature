Feature: Test the login security of the site

Scenario: Invalid username
Given I generate a new user account
And I access the main login page
When I enter the invalid username "matt123@matt.com" and valid password "password"
Then login is not permitted

Scenario: Invalid password
Given I generate a new user account
And I access the main login page
When I enter a valid username and the invalid password "monkeys321"
Then login is not permitted