import requests
from bs4 import BeautifulSoup

def parse_latest_url():
    """Load the TailScale packages page and parse the latest version URL for the current platform."""

    url = "https://pkgs.tailscale.com/stable/"
    response = requests.get(url)
    response.raise_for_status()
    soup = BeautifulSoup(response.text, "html.parser")
    for a in soup.find_all("a", href=True):
        if a["href"].endswith(".deb"):
            return a["href"]
    raise RuntimeError("No .deb package found on the TailScale packages page")