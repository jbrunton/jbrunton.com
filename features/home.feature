Feature: Home Page

  A dummy home page to test automation, deployment and infrastructure

  Scenario:
    Given a blog post "Some Post"
    When I am on the home page
    Then there should be a blog post "Some Post"
