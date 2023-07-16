@account @currency
Feature: Verify Account functionality alignment with expectations

  Scenario: Opened Account Form
    Given I am on "Home" page
    When I tap "Accounts, total" header
    And I tap "Add Account" button
    Then I can see "Create new Account" component

#  Scenario Outline: Creating different Account types
#    Given Opened Account Form
#    When I fill the "Account" field with <type>
#    Then I should see <fields> fields
#    But not <hidden> fields

#    Examples: 
#      | type | fields | hidden |
#      |   12 |      5 |      7 |
#      |   20 |      5 |     15 |
