Feature: Manage groups
  In order to make manage
  I am Administrator
  I want to make new group and edit and delete it

  Background:
    Given I am Administrator

  Scenario: Create new group
    And I am on the new admin group page
    When I fill in "groups_name" with "test_name"
    And I press i18n "submit"
    Then I should be on the admin group page
    And I should see i18n "created"
    And I should see "test_name"


  Scenario: Update group
    And I am on the edit admin group page
    Given the following groups:
      |name|
      |homes|
      |fanny|
      |cool|
      |great|
    When I follow i18n "edit" within "table tr:nth-child(1)"
    And I should see i18n "activerecord.attributes.group.name"
    And show me the page
    And fill in "homes1" for i18n "activerecord.attributes.group.name"
    And press i18n "submit"
    Then I should see i18n "updated"
    And I should be on the edit admin group page
    And I should see "homes1"



  Scenario: Delete group
    Given the following groups:
      |name|
      |homes|
      |fanny|
      |cool|
      |great|
    When I delete the 3rd group
    Then I should see the following groups:
     |name|
     |homes|
     |fanny|
     |great|
