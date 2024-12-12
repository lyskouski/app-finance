@account @currency
Feature: Verify Account Functionality

  Scenario Outline: Created different Account types
    Given Opened Account Form
     When I tap on 0 index of "ListSelector" fields
      And I tap "<type>" element
      And I enter "<type>" to "Enter Account Identifier" text field
      And I enter "<amount>" to "Set Balance" text field
      And I select "<currency>" from "CurrencySelector" with "Currency Type (Code)" tooltip
      And I tap "Create new Account" button
    Given I am on "Home" page
     Then I can see "Accounts, total" component
      And I can see "<type>" component
      And I can see "<result>" component

    Examples:
    | type         |  amount | currency |        result  |
    | Bank Account |     100 |   EUR    |       €100.00  |
    | Cash         |    1000 |   USD    |     $1,000.00  |
    | Credit Card  |    1500 |   JPY    |        ¥1,500  |
    | Debit Card   | 500.256 |   GBP    |       £500.26  |
    | Deposit      |   10000 |   AUD    |    $10,000.00  |
    | Credit       | 1000000 |   CNY    | ¥1,000,000.00  |
