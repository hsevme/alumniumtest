import unittest
#from alumnium import Alumni
from playwright.sync_api import sync_playwright
from dotenv import load_dotenv

load_dotenv()

class TestGoogleSearch(unittest.TestCase):
    def setUp(self):
        page = sync_playwright().start().chromium.launch(headless=False).new_page()
        page.goto("https://www.immoscout.de/")
 #       self.al = Alumni(page)

    def test_search(self):
        #self.al.do("accept all cookies")
        #self.al.do("do something only a human user would do and revert it afterwards")
        #self.al.do("enter Munich search bar")
        #self.al.do("choose buy from search bar dropdown")
        #self.al.do("choose house from search bar dropdown")
        #self.al.do("hit search")
        #self.al.do("try your luck with the anti bot test")
        #services = self.al.get("all offered houses in Munich")
        #print("All offers:", services)
        pass