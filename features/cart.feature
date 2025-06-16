Feature: Shopping Cart Functionality

  Scenario: Add a single product to the cart
    Given I am on the Shop page
    When I add the product "Album" to the cart
    Then the cart should contain 1 item
    And the cart total should reflect the price of "Album"

  Scenario: Add multiple different products to the cart
    Given I am on the Shop page
    When I add the product "Album" to the cart
    And I add the product "Beanie" to the cart
    Then the cart should contain 2 items
    And the total price should be the sum of "Album" and "Beanie"

  Scenario: Add the same product multiple times
    Given I am on the Shop page
    When I add the product "Album" to the cart
    And I add the product "Album" to the cart again
    Then the cart should contain 1 line item for "Album"
    And the quantity should be 2

  Scenario: View cart after adding products
    Given I am on the Shop page
    When I add the product "Beanie" to the cart
    And I navigate to the Cart page
    Then I should see "Beanie" listed in the cart
    And the quantity should be 1

  Scenario: Update product quantity in cart
    Given I am on the Shop page
    When I add the product "Beanie" to the cart
    And I navigate to the Cart page
    And I change the quantity of "Beanie" to 3
    Then the cart total should update to the price of 3 "Beanies"

  Scenario: Remove a product from the cart
    Given I am on the Shop page
    When I add the product "Beanie" to the cart
    And I navigate to the Cart page
    And I remove "Beanie" from the cart
    Then the cart should be empty

  Scenario: Cart persists across page reload
    Given I am on the Shop page
    When I add the product "Album" to the cart
    And I refresh the page
    Then the cart should still contain "Album"

  Scenario: Cart displays correct item count
    Given I am on the Shop page
    When I add the product "Album" to the cart
    And I add the product "Beanie with Logo" to the cart
    Then the cart icon should show "2 items"

  Scenario: Cart total reflects discounts
    Given I am on the Shop page
    When I add the product "Beanie with Logo" (on sale) to the cart
    Then the cart total should reflect the discounted price

  Scenario: Proceed to checkout from cart
    Given I am on the Shop page
    When I add the product "Album" to the cart
    And I navigate to the Cart page
    And I click on the "Proceed to checkout" button
    Then I should be redirected to the Checkout page
