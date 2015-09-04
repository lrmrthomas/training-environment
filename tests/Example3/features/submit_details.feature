Feature: Login and submitting user details

Scenario: Access the user details form and enter details
Given I have created an account, logged in and accessed the user details form
When I enter the user details including "Male" "Audi" driver from postcode "TQ2 1CC"
Then the user details are displayed successfully

Scenario: Access the user details form and enter different details
Given I have created an account, logged in and accessed the user details form
When I enter the user details including "Female" "Fiat" driver from postcode "PL1 5AA"
Then the user details are displayed successfully

Scenario: Access the user details form and enter no details
Given I have created an account, logged in and accessed the user details form
When I enter no user details 
Then the default user details are displayed successfully
