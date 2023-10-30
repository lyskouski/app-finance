@start
Feature: Verify Initial Flow

    Scenario: Applying basic configuration through the start pages
        Given I clear my preferences at the start
        Then I can see "Initial Setup" component
        When I tap "Save (Go Next)" button
        Then I can see "Acknowledge (Go Next)" button
        When I tap "Acknowledge (Go Next)" button
        Given preferences are updated (actually, mocked)
        Then I can see "Acknowledge (Go Next)" button
        When I tap "Acknowledge (Go Next)" button
        Then I can see "Create new Account" button
        When I tap on 0 index of "ListSelector" fields
        And I tap "Bank Account" element
        And I enter "Starting Page Account" to "Enter Account Identifier" text field
        And I enter "1000" to "Set Balance" text field
        And I tap "Create new Account" button
        Then I can see "Create new Budget Category" button
        When I enter "Starting Page Budget" to "Enter Budget Category Name" text field
        And I enter "1000" to "Set Balance" text field
        When I tap "Create new Budget Category" button
        Then I can see "Accounts, total" component
        And I can see "Starting Page Account" component
        And I can see "Starting Page Budget" component
