Feature: Login and logout

Scenario: Login to the web site and log out immediately
Given I have created an account and logged in 
When I choose to logout
Then I am logged out of the system