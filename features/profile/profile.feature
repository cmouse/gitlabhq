Feature: Profile
  Background:
    Given I sign in as a user

  Scenario: I look at my profile
    Given I visit profile page
    Then I should see my profile info

  Scenario: I edit profile
    Given I visit profile page
    Then I change my contact info
    And I should see new contact info

  Scenario: I change my password without old one
    Given I visit profile account page
    When I try change my password w/o old one
    Then I should see a missing password error message
    And I should be redirected to account page

  Scenario: I change my password
    Given I visit profile account page
    Then I change my password
    And I should be redirected to sign in page

  Scenario: I edit my avatar
    Given I visit profile page
    Then I change my avatar
    And I should see new avatar

  Scenario: My password is expired
    Given my password is expired
    And I am not an ldap user
    And I visit profile account page
    Then I redirected to expired password page
    And I submit new password
    And I redirected to sign in page

  Scenario: I unsuccessfully change my password
    Given I visit profile account page
    When I unsuccessfully change my password
    Then I should see a password error message

  Scenario: I reset my token
    Given I visit profile account page
    Then I reset my token
    And I should see new token

  Scenario: I visit history tab
    Given I have activity
    When I visit profile history page
    Then I should see my activity

  Scenario: I visit my user page
    When I visit profile page
    And I click on my profile picture
    Then I should see my user page

  @javascript
  Scenario: I change my application theme
    Given I visit profile design page
    When I change my application theme
    Then I should see the theme change immediately
    And I should receive feedback that the changes were saved

  @javascript
  Scenario: I change my code preview theme
    Given I visit profile design page
    When I change my code preview theme
    Then I should receive feedback that the changes were saved
