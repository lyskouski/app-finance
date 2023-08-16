@account @currency
Feature: Verify Account functionality alignment with expectations

    Scenario: Opened Account Form
        Given I am on "Accounts" page
        When I tap "Add Account" button
        Then I can see "Create new Account" component

    Scenario: Opened Budget Form
        Given I am on "Budgets" page
        When I tap "Add new Budget Category" button
        Then I can see "Create new Budget Category" component
