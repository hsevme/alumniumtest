import unittest
from alumnium import Alumni
from playwright.sync_api import sync_playwright
from dotenv import load_dotenv

load_dotenv()

class TestGoogleSearch(unittest.TestCase):
    def setUp(self):
        page = sync_playwright().start().chromium.launch(headless=False).new_page()
        page.goto("https://simplytest.de/")
        self.al = Alumni(page)

    def test_search(self):
        self.al.do("close cookie banner by denying consent")
        services = self.al.get("the services this enterprise offers")
        print("This enterprise offers:", services)