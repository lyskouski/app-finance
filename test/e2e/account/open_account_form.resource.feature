@account
Feature: Verify Account Basic Actions

  Scenario: Opened Account Form
    Given I am on "Accounts" page
     When I tap "Add Account" button
     Then I can see "Create new Account" button
