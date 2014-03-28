Feature: Edit blog posts

  As an admin
  I want to edit blog posts
  So that I can update the content as I see fit

  Scenario: Publish draft
    Given a draft blog post "Some Post"
    And I am authenticated as an admin
    When I go to the "edit" page for the blog post "Some Post"
    And I click "Publish"
    Then I should be on the "show" page for the blog post "Some Post"
    And the blog post "Some Post" should be published
    
