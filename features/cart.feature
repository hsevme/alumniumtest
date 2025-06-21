Feature: cart page

  Background:
    Given I am on the home page
    When "I click on 'Add to cart' button of product 'Album'"
    And I click on the 'View cart' button

  Scenario: cart page shows details
    Then "the product 'Album' listed in the cart"
    And "the price of 'Album' is 15.00 EUR"
    And "the quantity of 'Album' is 1"
    And "the subtotal is 15.00 EUR"

  Scenario: cart page item quantity can be increased
    When "I change the quantity of 'Album' to 2"
    And "I click the 'Update cart' button"
    Then I see that "a green banner shows that cart was updated"
    And "the updated quantity of 'Album' is 2"
    And "the updated subtotal is 30.00 EUR"

  Scenario: cart page item quantity can be decreased
    When "I change the quantity of 'Album' to 0"
    And "I click the 'Update cart' button"
    Then I see that "a green banner shows that cart was updated"
    And I see that "a blue banner shows that my cart is currently empty"

  Scenario: cart page item quantity cannot be decreased to negative value
    When "I enter '-1' into the quantity field of 'Album' and press enter"
    Then I see that "a message states that quantity cannot be set to negative value"
    And "there is one product 'Album' in cart"
    And "the total price is 15.00 EUR"

  Scenario: cart page item can be deleted from cart
    When "I click the delete button in 'Album' row of cart table"
    Then "my cart is empty"

  Scenario: cart page total cannot be decreased by invalid coupon code
    When "I enter 'XYZ' as coupon code and press 'Apply coupon'"
    Then I see that "a red message says that coupon code 'XYZ' does not exist"
    And "the total price is 15.00 EUR"

  Scenario: cart page points to checkout page
    When "I click the 'Proceed to checkout' button"
    Then "I am on the checkout page"

  Scenario: cart page points to product details page
    When "I click on the 'Album' product link in cart table"
    Then "I am on the product details page for 'Album'"
