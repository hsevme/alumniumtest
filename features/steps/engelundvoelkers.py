import dotenv
import os
from behave import *
from alumnium import Alumni
from playwright.sync_api import Page

dotenv.load_dotenv()

url = "https://www.engelvoelkers.com/de/de"

@given('we are on engelundvoelkers.com')
def step_impl(context):
    page: Page = context.page
    page.goto(url, timeout=60000, wait_until="domcontentloaded")