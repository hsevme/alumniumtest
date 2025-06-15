from playwright.sync_api import sync_playwright
from alumnium import Alumni, Model, Provider
from playwright.sync_api._generated import Browser
import os
from behave.runner import Context

def before_all(context: Context):
    context.browser = sync_playwright().start().chromium.launch(headless=False)
    print(f'ALUMNIUM_MODEL="{os.environ.get("ALUMNIUM_MODEL")}"')

def before_scenario(context, scenario):
    context.page = context.browser.new_page()
    context.al = Alumni(context.page, Model(Provider.ANTHROPIC))

def after_all(context):
    context.browser.close()