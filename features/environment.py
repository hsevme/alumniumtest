from dotenv import load_dotenv
from playwright.sync_api import sync_playwright
from alumnium import Alumni, Model, Provider
import os
from behave.runner import Context


def before_all(context: Context):
    load_dotenv()
    context.browser = sync_playwright().start().chromium.launch(headless=False)
    print(f'ALUMNIUM_MODEL="{os.environ.get("ALUMNIUM_MODEL")}"')

def before_scenario(context, scenario):
    context.page = context.browser.new_page()
    context.page.goto("https://autoprojekt.simplytest.de/")
    model_provider = os.environ.get("ALUMNIUM_MODEL", "ollama").lower()
    context.al = Alumni(context.page, Model(model_provider))

def after_all(context):
    context.al.quit()
    context.browser.close()