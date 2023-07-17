@account @currency
Feature: Verify Account functionality alignment with expectations

    Scenario Outline: Creating different Account types
        Given Opened Account Form
#        When I fill the "Account Type*" field with <type>
#        Then I should see <shown> fields
#            But I should not see <hidden> fields

    Examples:
        | type         | shown | hidden |
        | Bank Account | 5     | 7      |
#        | Cash         | 5     | 15     |
#        | Credit Card  | 5     | 15     |
#        | Debit Card   | 5     | 15     |
#        | Deposit      | 5     | 15     |
#        | Credit       | 5     | 15     |
