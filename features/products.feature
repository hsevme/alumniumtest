Feature: Product Listing on Shop Page

  Scenario: Display all visible products with name, price, image, and add-to-cart button
    Given I am on the Shop page
    When the page is fully loaded
    Then I should see a list of products
    And each product should have a name
    And each product should have an image
    And each product should have a price
    And each product should have an 'Add to cart' button

  Scenario: Adding a product updates the cart
    Given I am on the Shop page
    When I click the "Add to cart" button for the product "Album"
    Then the cart item count should now be 1
    And the cart total should reflect the price of the added product

