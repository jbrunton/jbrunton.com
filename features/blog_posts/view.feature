Feature: View Posts

  As a user
  I would like to read blog posts on the site

  Scenario: view post

    Given a blog post "Some Post" with content "Lorem ipsum"
    When I am on the page for the blog post "Some Post"
    Then I should see the post "Some Post" with content "Lorem ipsum"
