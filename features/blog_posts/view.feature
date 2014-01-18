Feature: View Posts

  As a user
  I would like to read blog posts on the site

  Scenario: view post

    Given a blog post "Some Post" with content "Lorem ipsum"
    When I am on the page for the blog post "Some Post"
    Then there should be a blog post "Some Post" with content "Lorem ipsum"

  Scenario: view posts
    Given a blog post "First Post" created yesterday
    And a blog post "Second Post" created today
    When I am on the page for blog posts
    Then there should be a blog post "First Post"
    And there should be a blog post "Second Post"
    And the first blog post should be "Second Post"
    
  Scenario: Markdown
    Given a blog post "Some Post" with content "lorem _ipsum_"
    When I am on the page for the blog post "Some Post"
    Then there should be the html "<p>lorem <em>ipsum</em></p>"
  
  Scenario: Header links
    Given a blog post "Some Post"
    When I am on the page for blog posts
    Then there should be a blog post "Some Post"
    And the title should be "Some Post" and should link to the blog post "Some Post"
    