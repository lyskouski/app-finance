
@budget
Feature: Verify Budget functionality alignment with expectations

    Scenario: Opened Budget Form
        Given I am on "Budgets" page
        When I tap "Add new Budget Category" button
        Then I can see "Create new Budget Category" button