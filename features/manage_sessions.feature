Feature: Manage sessions
  In order to make and destroy a session
  First not session. Second have session
  I want login and logout.

   Scenario: Error on create session
    Given I have no users
    And I am on the home page
    And I follow i18n "session.login"
    When I fill in "user_session_email" with "12333@mail.ru"
    And I fill in "user_session_password" with "skdhflksjdflkjs"
    And I press i18n "submit"
    And I should see error

  Scenario: Register and destroy session
    Given  I registered user with email "jone@mail.ru" and password "123123"
    And  I am on the login page
    When I fill in "user_session_email" with "jone@mail.ru"
    And I fill in "user_session_password" with "123123"
    And I press i18n "submit"
    Then I should not see error
    And I should be on the home page
    And I should see i18n "session.logged_in"
    When I go to the logout page
    Then I should be on the home page
    And I should see i18n "session.logged_out"




