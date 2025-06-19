Feature: home page

  Background:
    Given I am on the home page

  Scenario: home page shows a list of products
    Then "there is a heading 'Shop'"
    And "there is a list of products"

  Scenario: home page shows product price
    Then "I see that the product 'Album' costs 15.00 EUR"

  Scenario: home page shows products on sale
    Then "a label shows that 'Beanie' is on sale"
    And "'Beanie' is reduced by 10%"

  Scenario: home page product list can be sorted
    When "I change sorting order to 'Sort by price: low to high'"
    Then "'Single' is first in the product list and costs 2.00 EUR"
    And "'WordPress Pennant' is second in the product list"

  Scenario: home page has pagination
    Then "there are 17 products in total"
    And "only 12 of 17 products are shown in the product list"
    When "I switch to the second page of the product list"
    Then I see that "there are 5 other products on page 2"

  Scenario: home page points to product details page
    When "I click on the product 'Album'"
    Then "I am on the product details page for 'Album'"

  Scenario: home page points to cart page
    When "I add 'Album' to the cart"
    Then I see that "'View cart' button is placed next to 'Add to cart' button of 'Album'"
    When I click on the 'View cart' button
    Then "I am on the cart page"

  Scenario: home page can add product to cart
    When "I click on 'Add to cart' button of product 'Album'"
    And "cart has 1 item and total is 15.00 EUR"

  Scenario: home page has search function
    Then "there is a search bar"
    When "I type 'Album' into the search bar and press enter"
    Then "I am on the product details page for 'Album'""

  Scenario: home page shows cart details
    Then I see that "there are cart details displayed in the upper right corner"
    When "I hover over the cart details"
    Then I see that "a message 'No products in the cart' is displayed"