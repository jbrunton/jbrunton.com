Feature: Home Page

  As an admin
  I want to authenticate with Facebook
  So that I can administer blog posts

  Scenario:
    Given I have a Facebook account
    And I navigate to "users/auth/facebook"
    Then there should be a notice "Successfully authenticated from Facebook account."

