Feature: Shop Home Page Functionality

  Scenario: Viewing the shop home page
    Given I am on the shop home page
    Then I should see the shop title "Shop"
    And I should see a list of products

  Scenario: Viewing product details
    Given I am on the shop home page
    When I click on a product named "Album"
    Then I should see the product details for "Album"
    And I should see the price of the product as "15,00 €"

  Scenario: Adding a product to the cart
    Given I am on the shop home page
    When I click the "Add to cart" button for the product "Beanie"
    Then I should see the product "Beanie" added to my cart
    And I should see the cart item count increase by 1

  Scenario: Viewing the cart page
    Given I have added a product to the cart
    When I click on the "Cart" link
    Then I should be redirected to the cart page
    And I should see the product in my cart

  Scenario: Searching for a product
    Given I am on the shop home page
    When I enter "Beanie" in the search bar and press enter
    Then I should see search results related to "Beanie"

  Scenario: Sorting products by price
    Given I am on the shop home page
    When I select "Sort by price: low to high" from the sorting dropdown
    Then I should see the products sorted by price in ascending order

  Scenario: Viewing products on sale
    Given I am on the shop home page
    Then I should see products with sale badges
    And I should see the sale price and the original price for those products

  Scenario: Navigating to the contact page
    Given I am on the shop home page
    When I click on the "Contact Page" link
    Then I should be redirected to the contact page

  Scenario: Viewing recent posts
    Given I am on the shop home page
    When I scroll to the "Recent Posts" section
    Then I should see a list of recent posts

  Scenario: Viewing product categories
    Given I am on the shop home page
    When I scroll to the "Categories" section
    Then I should see a list of product categories

  Scenario: Selecting product options
    Given I am on the shop home page
    When I click on "Select options" for the product "Hoodie"
    Then I should see the available options for "Hoodie"

  Scenario: Viewing archives
    Given I am on the shop home page
    When I scroll to the "Archives" section
    Then I should see a list of archives by month

  Scenario: Logging in to the shop
    Given I am on the shop home page
    When I click on the "Log in" link in the Meta section
    Then I should be redirected to the login page

  Scenario: Viewing the checkout page
    Given I have added a product to the cart
    When I click on the "Checkout Page" link
    Then I should be redirected to the checkout page

  Scenario: Viewing entries feed
    Given I am on the shop home page
    When I click on the "Entries feed" link in the Meta section
    Then I should be redirected to the entries feed page
