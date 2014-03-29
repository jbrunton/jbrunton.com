Feature: Authentication

  As an admin
  I want to authenticate with Facebook
  So that I can administer blog posts

  Scenario: Authenticate admin
    Given I am on the admin page
    And I am an admin
    When I click "Sign in with Facebook"
    Then there should be a notice "Successfully authenticated from Facebook account."
    
  Scenario: Authenticate user
    Given I am on the admin page
    And I am not an admin
    When I click "Sign in with Facebook"
    Then there should be a notice "Sorry, you do not have admin permissions for this site."
  
  Scenario: Destroy session
    Given I am authenticated
    And I am on the home page
    When I click "Sign out"
    Then there should be a notice "Signed out successfully."

