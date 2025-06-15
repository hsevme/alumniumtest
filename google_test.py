import unittest
from alumnium import Alumni
from playwright.sync_api import sync_playwright
from dotenv import load_dotenv

load_dotenv()

class TestGoogleSearch(unittest.TestCase):
    def setUp(self):
        page = sync_playwright().start().chromium.launch(headless=False).new_page()
        page.goto("https://google.com/")
        self.al = Alumni(page)

    def test_search(self):
        self.al.do("close cookie banner")
        self.al.check("there is no cookie banner")
        self.al.do("search for 'Mercury element'")
        self.al.check("a anti-robot page appears instead of search results")