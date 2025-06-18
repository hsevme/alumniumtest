Feature: Product Browsing and Adding to Cart

  Scenario: Browse products and add to cart
    Given I am on the shop page
    When I see a list of products
    And I click on "Add to cart" for the product "Album"
    Then I should see the cart item count increase by 1

  Scenario: View product details
    Given I am on the shop page
    When I click on the product "Album"
    Then I should see the product details page for "Album"
    And I should see the price of the product as "15,00 €"
