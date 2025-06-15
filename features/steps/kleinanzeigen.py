import dotenv
import os
from behave import *
from alumnium import Alumni
from playwright.sync_api import Page

dotenv.load_dotenv()

@given('we are on kleinanzeigen.de')
def step_impl(context):
    url = "https://www.kleinanzeigen.de/"
    page: Page = context.page
    page.goto(url, timeout=60000, wait_until="domcontentloaded")

## UTIL

def log_in(al: Alumni):
    user_name = os.environ.get('USER_NAME')
    password = os.environ.get('USER_PASSWORD')
    al.do('click login button')
    al.do('when verification is required, drag the slider to the middle of the sliderbg')
    al.do(f'log in with the name "{user_name}" and password "{password}')