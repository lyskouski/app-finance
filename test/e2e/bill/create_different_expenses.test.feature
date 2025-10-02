@budget @currency
Feature: Verify Expenses Functionality

  Scenario: Set Up
    Given Created different Account types
      And Created different Budget types

  Scenario Outline: Added different Expenses
    Given Opened Expense Form
     When I select "<account>" from "AccountSelector" with "Enter Account Identifier" tooltip
      And I select "<budget>" from "BudgetSelector" with "Enter Budget Category Name" tooltip
      And I enter "<amount>" to "Set Amount" text field
      And I select "<currency>" from "CodeCurrencySelector" with "Currency Type (Code)" tooltip
      And I enter "<exchange>" to "<cur> Conversion" text field
      And I enter "<account> - <budget>" to "Set Expense Details" text field
      And I tap "Add new Bill" button
     Then I can see "Accounts, total" component
      And I can see "<account_rest>" component
      And I can see "<budget_note>" component
      And I can see "<budget_left>" component

    Examples:
    | account      | cur | budget    | amount | currency | exchange | account_rest |       budget_note |   budget_left |
    | Bank Account | EUR | Limited   |     20 | PLN      |     0.50 |       €90.00 |  €10.00 / €100.00 |   €90.00 left |
    | Cash         | USD | Limited   |     50 | PLN      |     2.00 |      $900.00 |  €35.00 / €100.00 |   €65.00 left |
    | Credit Card  | JPY | Unlimited |    100 | PLN      |     0.01 |       ¥1,499 |         Unlimited | $200.00 spent |
    | Debit Card   | GBP | Group / 1 |     25 | PLN      |     0.40 |      £490.26 |  $50.00 / $125.00 |         Group |
    | Bank Account | EUR | Group / 2 |      5 | PLN      |     2.20 |       €79.00 |  $60.00 / $125.00 |         Group |
    | Cash         | USD | Group / 2 |     10 | PLN      |     4.50 |      $855.00 | $105.00 / $125.00 |         Group |

  Scenario: Verify Filters
    Given I am on "Bills" page
     When I tap "Search" button
      And I select "Bank Account" from "AccountSelector" with "Enter Account Identifier" tooltip
      And I select "Limited" from "BudgetSelector" with "Enter Budget Category Name" tooltip
      And I tap "Search" button
     Then I can see "Bank Account - Limited" component
      And I cannot see "Cash - Limited" component
      And I cannot see "Bank Account - Group / 2" component

  Scenario: Tear Down
    Given I am on "Currencies" page
     Then I can see "PLN-EUR" component
     Then I can see "2.2" component
     Then I can see "PLN-USD" component
     Then I can see "4.5" component
     Then I can see "PLN-JPY" component
     Then I can see "0.01" component
     Then I can see "PLN-GBP" component
     Then I can see "0.4" component
