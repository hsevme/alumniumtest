from allure_commons.types import AttachmentType
from dotenv import load_dotenv
from playwright.sync_api import sync_playwright
from alumnium import Alumni, Model
import os
import shutil
import allure
import time

def before_all(context):
    load_dotenv()
    context.playwright = sync_playwright().start()

def before_scenario(context, scenario):
    # === Setup directories ===
    safe_name = scenario.name.replace(" ", "_").replace("/", "_")
    base_dir = os.path.abspath("artifacts")
    video_dir = os.path.join(base_dir, "videos", safe_name)
    trace_dir = os.path.join(base_dir, "traces", safe_name)
    os.makedirs(video_dir, exist_ok=True)
    os.makedirs(trace_dir, exist_ok=True)

    # === Launch browser context with video recording ===
    context.browser = context.playwright.chromium.launch(headless=True, slow_mo=50)
    context.pw_context = context.browser.new_context(
        record_video_dir=video_dir,
        viewport={"width": 1280, "height": 800}
    )

    # === Start tracing ===
    context.pw_context.tracing.start(
        screenshots=True,
        snapshots=True,
        sources=True
    )

    # === Create page and go to app ===
    context.page = context.pw_context.new_page()

    # === Setup Alumni ===
    # model_provider = os.environ.get("ALUMNIUM_MODEL")
    # if not model_provider: model_provider = "google"
    model_provider = "google"
    print(f"model provider: {model_provider}")
    context.al = Alumni(context.page, Model(model_provider))


def after_scenario(context, scenario):
    safe_name = scenario.name.replace(" ", "_").replace("/", "_")

    # === Screenshot ===
    screenshot_path = os.path.join("artifacts", "screenshots", f"{safe_name}.png")
    os.makedirs(os.path.dirname(screenshot_path), exist_ok=True)
    context.page.screenshot(path=screenshot_path)
    allure.attach.file(screenshot_path, name="Screenshot", attachment_type=AttachmentType.PNG)

    # === Trace ===
    trace_path = os.path.join("artifacts", "traces", f"{safe_name}.zip")
    context.pw_context.tracing.stop(path=trace_path)
    allure.attach.file(trace_path, name="Playwright Trace", attachment_type=None)

    # === Video ===
    # Note: videos are saved inside record_video_dir per page
    # We move them to a known location to attach
    video_dir = os.path.join("artifacts", "videos", safe_name)
    video_path = None
    if os.path.exists(video_dir):
        for file in os.listdir(video_dir):
            if file.endswith(".webm"):
                full_path = os.path.join(video_dir, file)

                # Wait for the file to become non-zero size
                for _ in range(10):
                    if os.path.getsize(full_path) > 0:
                        break
                    time.sleep(0.5)

                video_path = os.path.join("artifacts", "videos", f"{safe_name}.webm")
                shutil.move(full_path, video_path)
                allure.attach.file(video_path, name="Video", attachment_type=AttachmentType.WEBM)

    # === Clean up Playwright objects ===
    context.page.close()
    context.pw_context.close()
    context.browser.close()

    if hasattr(context.al, "cache"):
        context.al.cache.session.commit()


def after_all(context):
    context.playwright.stop()
