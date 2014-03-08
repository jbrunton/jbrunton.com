Feature: Edit blog posts

  As an admin
  I want to write blog posts
  So that I can impart thoughtful and intelligent articles
  
  Scenario: Write post
    Given I am authenticated as an admin
    When I compose a blog post with title "Some Post"
    And I go to the home page
    Then there should be a blog post "Some Post"

  Scenario: Validation
    Given I am authenticated as an admin
    When I compose a blog post with title ""
    Then I should see the text "Title can't be blank"
    
  Scenario: Authorization (signed out)
    When I navigate to "blog/new"
    Then I should see the text "You are not authorized to access this page."
    
  Scenario: Authorization (authenticated)
    Given I am authenticated
    When I navigate to "blog/new"
    Then I should see the text "You are not authorized to access this page."
    