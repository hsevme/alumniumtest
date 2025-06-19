from behave import *
from playwright.sync_api import Page


@when("I click on the 'View cart' button")
def step_impl(context):
    page: Page = context.page
    page.locator(".added_to_cart").get_by_text('View cart').click()
