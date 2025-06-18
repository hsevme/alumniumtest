Feature: Shopping Cart Functionality

  Background:
    Given I am a logged-in user

  Scenario: Add a single product to the cart
    Given I am on the Shop page
    When I add the product "Album" to the cart
    Then the cart should contain exactly 1 item
    And the cart total should equal the price of 1 "Album"

  Scenario: Add two different products to the cart
    Given I am on the Shop page
    When I add the product "Album" to the cart
    And I add the product "Beanie" to the cart
    Then the cart should contain exactly 2 different items
    And the cart total should equal the sum of 1 "Album" and 1 "Beanie"

  Scenario: Add the same product multiple times
    Given I am on the Shop page
    When I add the product "Album" to the cart
    And I add the product "Album" to the cart again
    Then the cart should contain 1 line item for "Album"
    And the quantity of "Album" should be 2
    And the total should equal the price of 2 "Albums"

  Scenario: View cart after adding a product
    Given I am on the Shop page
    When I add the product "Beanie" to the cart
    And I go to the Cart page
    Then the cart should list "Beanie"
    And the quantity for "Beanie" should be 1

  Scenario: Update quantity of product in cart
    Given the cart contains 1 "Beanie"
    When I go to the Cart page
    And I update the quantity of "Beanie" to 3
    Then the cart should show 3 "Beanies"
    And the total should equal the price of 3 "Beanies"

  Scenario: Remove a product from the cart
    Given the cart contains 1 "Beanie"
    When I go to the Cart page
    And I remove "Beanie" from the cart
    Then the cart should be empty

  Scenario: Cart persists after page refresh
    Given I have added "Album" to the cart
    When I refresh the Shop page
    Then the cart should still contain "Album"

  Scenario: Cart icon displays correct item count
    Given I am on the Shop page
    When I add "Album" to the cart
    And I add "Beanie with Logo" to the cart
    Then the cart icon should display "2 items"

  Scenario: Cart total reflects discounted product price
    Given the product "Beanie with Logo" is on sale
    When I add "Beanie with Logo" to the cart
    Then the cart total should reflect the discounted price

  Scenario: Proceed to checkout from cart
    Given the cart contains 1 "Album"
    When I go to the Cart page
    And I click "Proceed to checkout"
    Then I should be on the Checkout page

  Scenario: Add product to cart without being on the Shop page
    Given I am on the Home page
    When I attempt to add "Album" to the cart
    Then I should be redirected to the Shop page
    And "Album" should be added to the cart

  Scenario: Cart total updates after removing one of multiple products
    Given the cart contains "Album" and "Beanie"
    When I remove "Beanie" from the cart
    Then the cart should only contain "Album"
    And the total should equal the price of "Album"

  Scenario: Attempt to add out-of-stock product
    Given the product "Limited Edition Vinyl" is out of stock
    When I try to add "Limited Edition Vinyl" to the cart
    Then I should see a message "Product is out of stock"
    And the cart should not contain "Limited Edition Vinyl"

  Scenario: Clear all items from cart
    Given the cart contains multiple products
    When I click "Clear Cart"
    Then the cart should be empty
    And the cart total should be $0

  Scenario: Cart handles fractional prices
    Given I am on the Shop page
    When I add the product "Digital Track" priced at $0.99 to the cart
    Then the cart total should be $0.99

  Scenario: Ensure cart item quantity cannot be set to negative
    Given the cart contains 1 "Album"
    When I attempt to set the quantity of "Album" to -1
    Then I should see an error "Invalid quantity"
    And the quantity should remain 1

  Scenario: Ensure cart handles 0 quantity removal
    Given the cart contains 1 "Album"
    When I set the quantity of "Album" to 0
    Then "Album" should be removed from the cart
