import sys
import subprocess
import json
import random
#import boto3

# One-shot process that 
#   decrypts hostname to random choice of controller
#   downloads and extracts chromium to a path
#   runs chromium headless with remote debug port
#   connects to controller
#   gets a job (or quits)
#   does a job
#   returns result to controller

def get_controller_config():
    with open("config.json", "r") as file:
        config = json.load(file)

    # Retrieve one of the controller secrets (random from list)
    return decrypt_secret_path(random.choice(config['secret_paths'])), config['chromium_download_url'], config['chromium_extract_path'], config['debug_port']

def decrypt_secret_path(secret_path):
    hostname,port=None
    # boto3 logic to connect to AWS Secret Manager to retreive secret_path value (json) and assign hostname and port
    if controller_hostname or controller_port is None:
        print("Unable to retrieve hostname or port secret")
        sys.exit(1)
    return hostname, port

def download_and_run_chromium(url, path, dbg_port):
    subprocess.run(["mkdir", "-p", f"{path}"])
    subprocess.run(["wget", f"{url}", "-O", "/tmp/chromium_dl.zip"])
    subprocess.run(["unzip", "/tmp/chromium_dl.zip", "-d", path])
    subprocess.run([f"{path}/chromium", "--headless", "--no-sandbox", f"--remote-debugging-port={dbg_port}"])

def get_job(host, port="8081"):
    # logic to connect to controller and get assigned a job
    # or sys.exit
    pass

def run_tests():
    # logic to run whatever tests we need and derive some result (returned)
    return True

def send_result(res):
    # logic to connect to controller and tell it "jobid=?, result=?"
    pass

if __name__ == "__main__":
    controller_hostname, controller_port, chromium_url, chromium_path, debug_port = get_controller_config()
    download_and_run_chromium(chromium_url, chromium_path, debug_port)
    send_result(run_tests(get_job(controller_hostname, controller_port)))