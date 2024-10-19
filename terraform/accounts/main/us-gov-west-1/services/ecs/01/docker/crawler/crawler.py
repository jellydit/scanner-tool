import os
import subprocess
import time

def get_controller_config():
    with open("config.json", "r") as file:
        config = json.load(file)
    return config['controller_hostname'], config['controller_port']

def download_and_run_chromium():
    chromium_path = "/path/to/chromium"
    subprocess.run(["wget", "http://path.to.chromium", "-O", f"{chromium_path}.zip"])
    subprocess.run(["unzip", f"{chromium_path}.zip", "-d", chromium_path])
    subprocess.run([f"{chromium_path}/chromium", "--headless", "--no-sandbox", "--remote-debugging-port=9222"])

if __name__ == "__main__":
    controller_hostname, controller_port = get_controller_config()
    download_and_run_chromium()
    # additional crawler logic here