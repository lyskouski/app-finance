@account @currency
Feature: Verify Account functionality alignment with expectations

    Scenario: Opened Account Form
        Given I am on "Home" page
        When I tap "Accounts, total" header
            And I tap "Add Account" button
        Then I can see "Create new Account" component
