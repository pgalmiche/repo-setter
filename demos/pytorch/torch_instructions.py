# Python file

import requests
import time

TORCH_API_URL = "http://torch_repo-setter:5000"  # Assuming the PyTorch container is named "torch-container"


def compute():
    # wait the time the torch container loads
    time.sleep(3)
    try:
        response = requests.get(f"{TORCH_API_URL}/perform-computation")
        response.raise_for_status()  # Raise an exception for HTTP errors
        result = response.json()
        return result
    except requests.RequestException as e:
        print(f"Error during computation: {e}")
        return None


if __name__ == "__main__":
    result = compute()
    if result is not None:
        print("Computation result:", result)
