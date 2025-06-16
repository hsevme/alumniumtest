from dotenv import load_dotenv
from playwright.sync_api import sync_playwright
from alumnium import Alumni, Model, Cache
import os
from behave.runner import Context


def before_all(context: Context):
    load_dotenv()
    context.playwright = sync_playwright().start()
    context.browser = context.playwright.chromium.launch(headless=False)

def before_scenario(context):
    context.page = context.browser.new_page()
    context.page.goto("https://autoprojekt.simplytest.de/")

    model_provider = os.environ.get("ALUMNIUM_MODEL", "ollama").lower()
    context.al = Alumni(context.page, Model(model_provider))

def after_scenario(context):
    context.page.close()
    al: Alumni = context.al
    cache: Cache = al.cache
    cache.session.commit()

def after_all(context):
    context.browser.close()
    context.playwright.close()