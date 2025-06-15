Feature: do stuff on kleinanzeigen

    Scenario: log in

        Given we are on kleinanzeigen.de
        And the cookie banner was dismissed
        
        When we log in as test user
        When "we do something naughty"

        Then "we are logged in"