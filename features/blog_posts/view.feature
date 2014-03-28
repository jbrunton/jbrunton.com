Feature: View Posts

  As a user
  I would like to read blog posts on the site

  Scenario: View post

    Given a published blog post "Some Post" with jump text "Lorem ipsum" and body text "dolor sit amet"
    When I am on the page for the blog post "Some Post"
    Then there should be a blog post "Some Post" with jump text "Lorem ipsum" and body text "dolor sit amet"

  Scenario: Markdown
    Given a published blog post "Some Post" with jump text "lorem _ipsum_"
    When I am on the page for the blog post "Some Post"
    Then there should be the html "<p>lorem <em>ipsum</em></p>"
  
  Scenario: Header links
    Given a published blog post "Some Post"
    When I am on the page for blog posts
    Then there should be a blog post "Some Post"
    And its title should be "Some Post" and should link to the blog post "Some Post"
  
  Scenario: View dates
    Given a blog post "Some Post" published on 2013-05-01
    When I am on the page for blog posts
    Then there should be a blog post "Some Post"
    And its date should be "1 May, 2013"

  Scenario: View date
    Given a blog post "Some Post" published on 2013-05-01
    When I am on the page for the blog post "Some Post"
    Then there should be a blog post "Some Post"
    And its date should be "1 May, 2013"
  
  Scenario: Continue Reading
    Given a published blog post "Some Post"
    When I am on the page for blog posts
    Then there should be a blog post "Some Post"
    And it should have a link "Continue Reading" which links to the blog post "Some Post"