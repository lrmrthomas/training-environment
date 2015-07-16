@Test of site to be put in Git
Feature: Create user, login and access user details form

Scenario: Access the user details form
Given I have created an account, logged in and accessed the user details form
When I enter the user details
Then the user details are displayed successfully
