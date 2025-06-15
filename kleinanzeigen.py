import dotenv
from alumnium import Alumni
from playwright.sync_api import sync_playwright

dotenv.load_dotenv()

url = "https://www.kleinanzeigen.de/"

with sync_playwright() as p:
    browser = p.chromium.launch(headless=False)
    page = browser.new_page()
    page.goto(url, timeout=60000, wait_until="domcontentloaded")
    
    al = Alumni(page)

    al.do("schließe das Cookie-Banner")
    al.do("close login tool tip")
    al.do("use search bar to find houses in Munich")
    services = al.get("all offered houses in Munich")
    print("All offers:", services)

    browser.close()
