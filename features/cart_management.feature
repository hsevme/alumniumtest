Feature: Cart Management

  Scenario: View cart contents
    Given I have added a product to the cart
    When I navigate to the cart page
    Then I should see the product "Album" listed in the cart
    And I should see the price as "15,00 €"
    And I should see the quantity as "1"
    And I should see the subtotal as "15,00 €"

  Scenario: Update product quantity in cart
    Given I am on the cart page
    And I have the product "Album" in my cart
    When I change the quantity of "Album" to "2"
    And I click the "Update cart" button
    Then I should see the updated quantity as "2"
    And I should see the updated subtotal for the product

  Scenario: Apply coupon code
    Given I am on the cart page
    When I enter a valid coupon code in the "Coupon code" field
    And I click the "Apply coupon" button
    Then I should see the cart totals updated with the discount applied
