@account @currency
Feature: Verify Account functionality alignment with expectations

  Scenario: Opened Account Form
    Given I am on "Main" page
    When I tap "Account" header
    And I tap "Create" button
    Then I can see "Account Form" component

#  Scenario Outline: Creating different Account types
#    Given Opened Account Form
#    When I fill the "Account" field with <type>
#    Then I should see <fields> fields
#    But not <hidden> fields

#    Examples: 
#      | type | fields | hidden |
#      |   12 |      5 |      7 |
#      |   20 |      5 |     15 |
