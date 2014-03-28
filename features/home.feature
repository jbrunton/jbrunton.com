Feature: Home Page

  A dummy home page to test automation, deployment and infrastructure

  Scenario: Show posts
    Given a blog post "Some Post"
    When I am on the home page
    Then there should be a blog post "Some Post"

  Scenario: Ordering
    Given a blog post "First Post" created on 2013-05-01
    And a blog post "Second Post" created on 2013-06-01
    When I am on the page for blog posts
    Then there should be a blog post "First Post"
    And there should be a blog post "Second Post"
    And the first blog post should be "Second Post"

