@check_title_register
Feature: Confirm that the correct title register information is present

@check_DT160760
Scenario: Check the title register of title DT160760
    Given the details of title number DT160760
    When I view the title number "DT160760"
    Then the correct title number is displayed
    And the correct DLR which owns the title is displayed
    And the correct role code of entry #2 is displayed
    And the correct value of the first UPRNS entry is displayed
    And the correct message related to the 5th migrator error is displayed
    And the correct infill type of entry #1 is displayed
    And the correct district of the title is displayed
    And the correct first item of co-ordinates for the geometry entry of the title is displayed

@check_GR504812
Scenario: Check the title register of title GR504812
    Given the details of title number GR504812
    When I view the title number "GR504812"
    Then the correct title number is displayed
    And the correct tenure is displayed
    And the correct entry id of entry #12 is displayed
    And the correct application reference of the title is displayed
    And the correct extractor related to the 1st migrator error is displayed
    And the correct sub register of entry #16 is displayed
    And the correct edition date of the title is displayed
    And the correct status of the first entry on the title is displayed

@check_MS465614
Scenario: Check the title register of title MS465614
    Given the details of title number MS465614
    When I view the title number "MS465614"
    Then the correct title number is displayed
    And the correct DLR which owns the title is displayed
    And the correct language of entry #5 is displayed
    And the correct message number of the 1st migrator error is displayed
    And the correct message related to the 1st migrator error is displayed
    And the correct description of the deed within the 9th entry is displayed
    And the correct role code of the 12th entry is displayed
    And the correct type of the map entry within the Geometry entry for the title is displayed

@check_BD161882
Scenario: Check the title register of title BD161882
    Given the details of title number BD161882
    When I view the title number "BD161882"
    Then the correct title number is displayed
    And the correct class of title is displayed
    And the correct template text of entry #2 is displayed
    And the correct application reference of the title is displayed
    And the correct names of proprietors contained within entry #7 are displayed
    And the correct sub register of entry #4 is displayed
    And the correct edition date of the title is displayed
    And the correct status of the 7th entry on the title is displayed

@check_BD161870
Scenario: Check the title register of title BD161870
    Given the details of title number BD161870
    When I view the title number "BD161870"
    Then the correct title number is displayed
    And the correct DLR which owns the title is displayed
    And the correct role code of entry #1 is displayed
    And the correct full text of entry #2 is displayed
    And the correct text within the first infill of entry #3 is displayed
    And the correct postcode of the address contained within the infill for entry #1 is displayed
    And the correct district of the title is displayed
    And the correct properties within the index/crs entry of the Geometry of the title is displayed
