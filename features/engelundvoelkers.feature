Feature: do stuff on engelundvoelkers

    Scenario: search

        Given we are on engelundvoelkers.com
        And the cookie banner was dismissed

        When "we search for houses to buy"
        And "type Munich as location"

        Then "there are only offers in Munich displayed"
        And "there are offers with a price below 1 million euros"