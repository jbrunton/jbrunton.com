Feature: View Posts

  As a user
  I would like to read blog posts on the site

  Scenario: view post

    Given a blog post "Some Post" with content "Lorem ipsum"
    When I am on the page for the blog post "Some Post"
    Then I should see the post "Some Post" with content "Lorem ipsum"

  Scenario: view posts
    Given a blog post "First Post" created yesterday
    And a blog post "Second Post" created today
    When I am on the page for blog posts
    Then I should see the post "First Post"
    And I should see the post "Second Post"
    And the first blog post should be "Second Post"