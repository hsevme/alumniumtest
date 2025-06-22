from alumnium import Alumni
from behave import *
from playwright.sync_api import Page


@when("I click on the 'View cart' button")
def step_impl(context):
    page: Page = context.page
    page.locator(".added_to_cart").get_by_text('View cart').click()

@when("I clear the input field '{string}'")
def step_impl(context, string):
    al: Alumni = context.al
    action = f"I clear the input field {string}"
    al.learn(action,
             [f"Double click input field '{string}'",#
              f"Delete contents of input field '{string}'",
              "Press enter"])
    al.do(action)
