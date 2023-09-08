@budget @currency
Feature: Verify Budget Functionality

    Scenario Outline: Created different Budget types
        Given Opened Budget Form
        When I enter "<name>" to "Enter Budget Category Name" text field
          And I enter "<amount>" to "Set Balance" text field
          And I tap on 0 index of "CurrencySelector" fields
          And I enter "<currency>" to "Type Code" text field
          And I tap on 1 index of "<currency>" element
          And I tap "Close" element # Popup with icons
          And I tap "Create new Budget Category" button
        Then I can see "Budgets, left" component
          And I can see "<name_result>" component
          And I can see "<result>" component

    Examples:
        | name         |  amount | currency |          result | name_result |
        | Limited      |     100 |   EUR    |    €100.00 left | Limited     |
        | Unlimited    |       0 |   USD    |     $0.00 spent | Unlimited   |
        | Group / 1    |      50 |   USD    |     $50.00 left | Group / 1   |
        | Group / 2    |      75 |   USD    | €0.00 / €125.00 | Group       |
