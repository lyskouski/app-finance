
@budget
Feature: Verify Budget Basic Actions

  Scenario: Opened Expense Form
    Given I am on "Home" page
     When I tap "Add Bill , Income or Transfer" button
     Then I can see "Add new Bill" button