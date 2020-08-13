Feature: Hello Cucumber
  As First time cucumber feature writer
  I want to start with user creation
  So creating the user below


  Scenario: Create user
    When I want use the API
    But I can't create user without a role
    Then Create a role first
    Then Create a user