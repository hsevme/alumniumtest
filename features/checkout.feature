Feature: Checkout Process

  Scenario: Proceed to checkout
    Given I have added a product to the cart
    When I click the "Proceed to checkout" button on the cart page
    Then I should be redirected to the checkout page
    And I should see the "Billing details" form

  Scenario: Fill out billing details
    Given I am on the checkout page
    When I fill out the "Billing details" form with valid information
    And I select a payment method
    Then I should be able to place the order

  Scenario: Place an order
    Given I am on the checkout page
    And I have filled out the "Billing details" form
    When I click the "Place order" button
    Then I should see an order confirmation
    And I should receive an order confirmation email
