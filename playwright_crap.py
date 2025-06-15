from playwright.sync_api import sync_playwright

with sync_playwright() as p:
    browser = p.chromium.launch(headless=False)
    page = browser.new_page()
    page.goto("https://www.kleinanzeigen.de/", timeout=60000, wait_until="domcontentloaded")
    
    

    
    browser.close()
