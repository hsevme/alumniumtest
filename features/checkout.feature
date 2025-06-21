Feature: checkout page

  Background:
    Given I am on the home page
    When "I click on 'Add to cart' button of product 'Album'"
    And I click on the 'View cart' button
    And "I click the 'Proceed to checkout' button"

  Scenario: checkout page has elements
    Then "there is a heading 'Checkout page'"
    And "there are the following small headings:"
      | HEADING                |
      | Billing details        |
      | Additional information |
      | Your order             |
    And "there are the following 'Billing details' fields:"
      | FIELD LABEL                  | NOTE     |
      | First name                   | required |
      | Last name                    | required |
      | Company name                 | optional |
      | Country / Region             | required |
      | Street address               | required |
      | Apartment, suite, unit, etc. | optional |
      | Town / City                  | required |
      | Postcode / ZIP               | required |
      | Phone                        | required |
      | Email address                | required |
    And "there is one optional input field 'Order notes' under 'Additional information'"

  Scenario: checkout page input field shows whether entered billing info is valid
    When "I fill the 'First name' input with valid information"
    Then I see that "a green bar indicates the information in the 'First name' input field is valid"
    When I clear the input field 'First name'
    And "click the 'Last name' input field"
    Then I see that "a red bar indicates the information in the 'First name' input field is invalid"

  Scenario: checkout page points to order received page
    When "I fill out the 'Billing details' form with valid information"
    And "I click the 'Place order' button"
    Then "I am on the order received page"

  Scenario: checkout page shows price details
    Then "price and quantity of 'Album' is displayed: 15.00 EUR"
    And "the subtotal and total prices are displayed: each 15.00 EUR"

  Scenario: checkout page shows payment options
    Then "I see direct bank transfer is the only available payment option"
