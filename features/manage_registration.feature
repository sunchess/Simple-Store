Feature: Manage user_registrations
  In order to make a registration
  A not registered user
  I want to register оne self

  #Background:
  #  Given I have no users

  Scenario: Register new user
    Given I am on the register page
    When I fill in "user_email" with "email@mail.ru"
    And I fill in "user_password" with "password1"
    And I fill in "user_password_confirmation" with "password1"
    And I press i18n "submit"
    Then  I should be on the home page
    And I should see i18n "user.flashes.register_done"

  Scenario: Should have errors
    Given I am on the register page
    When I fill in "user_email" with "emailmail.ru"
    And I fill in "user_password" with "password"
    And I fill in "user_password_confirmation" with "password12"
    And I press i18n "submit"
    Then I should see error

  Scenario: Registered user wants register got error
    Given I registered user with email "email@mail.ru" and password "password1"
    And I logged in with email "email@mail.ru" and password "password1"
    When I go to the register page
    Then  I should be on the home page
    And I should see i18n "user.flashes.mast_logged_out"



