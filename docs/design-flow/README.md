# Fingrom: Design Flow

## Structural Mind Map

```mermaid
mindmap
  root((Fingrom)
    {{Accounts}}
    ::icon(fas fa-coins)
      [Bank Account]
        Track money as is
        Show error on negative value
      [Cash]
        Track money as is
        Show error on negative value
      [Debit Card]
        Show error on negative value
        Show error after "Till Date"
      [Credit Card]
      ::icon(fas fa-tasks)
      [Deposit]
      ::icon(fas fa-tasks)
        Cannot be used for expenses
        Has a percentage gross per year/month
      [Credit]
      ::icon(fas fa-tasks)
        By creation ask for a transfer to another account
        Has a negative state
        Income tracked as bills
    {{Budgets}}
    ::icon(fas fa-wallet)
      [Track expenses]
      ::icon(fas fa-tasks)
        Per week
        Per month
        Per year
      [Percentage of Income]
      [Limited Amount]
    {{Outcome}}
    ::icon(fas fa-money-check-alt)
      (Bills)
        Set currency
        Edit bill by changing category and account
    {{Income}}
    ::icon(fas fa-hand-holding-usd)
      (Invoices)
        Set currency
        Edit capability
      (Transfers)
        Set currency
        Edit capability
    {{Currencies}}
    ::icon(fas fa-coins)
      [View]
      [Update]
      ::icon(fas fa-tasks)
      [Hide / Delete]
      ::icon(fas fa-tasks)
    {{Goals}}
    ::icon(fas fa-bullseye)
      [View]
      [Update]
      [Complete]
        Show that the goal is completed 
```

## User Flows

A user flow encompasses any conceivable path a customer might traverse within a website or application. Additionally, 
the term "user flow" can extend to denote a visualization or map illustrating this journey, often referred to as a 
flowchart or UX flow.

### Add new Bill
```mermaid
flowchart LR
    a[Open App] --> 
    b[Tap on Add New] -->
    b1[Select Account] -->
    b2[Select Budget Category] -->
    c[Enter Amount] -->
    d[Enter Description] -->
    e[Tap Save] -->
    z[Close App]

    b --> c
    b1 --> c
    c --> e
```

### Add new Budget Category
```mermaid
flowchart LR
    a[Open App] --> 
    b[Tap on Menu] -->
    c[Tap on Budgets] -->
    d[Tap on Add New] -->
    e[Enter Category Name] -->
    f[Enter Limit > 1] -->
    g[Tap Save] -->
    z[Close App]

    f1[Enter Limit > 0 .. < 1]

    a --> c
    a --> d
    e --> g
    e --> f1
    f1 --> g
```
