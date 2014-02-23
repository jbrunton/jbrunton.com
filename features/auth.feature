Feature: Home Page

  As an admin
  I want to authenticate with Facebook
  So that I can administer blog posts

  Scenario: Authenticate
    Given I am on the homepage
    When I click "Sign in with Facebook"
    Then there should be a notice "Successfully authenticated from Facebook account."
  
  Scenario: Destroy session
    Given I am authenticated
    And I am on the homepage
    When I click "Sign out"
    Then there should be a notice "Signed out successfully."

