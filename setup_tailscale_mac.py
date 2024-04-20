from pathlib import Path
import tempfile

import dload
import requests
from bs4 import BeautifulSoup


def parse_latest_url():
    """Load the TailScale packages page and parse the latest version URL for the current platform."""

    list_url = "https://pkgs.tailscale.com/stable/"
    response = requests.get(list_url)
    response.raise_for_status()
    soup = BeautifulSoup(response.text, "html.parser")
    # Match URL for text "Tailscale-*-macos.pkg"
    for a in soup.find_all("a", href=True):
        if a.text.startswith("Tailscale-") and a.text.endswith("-macos.zip"):
            pkg_url = a["href"]
            if not pkg_url.startswith("http"):
                pkg_url = f"{list_url}{pkg_url}"
            return pkg_url


if __name__ == "__main__":    
    target_app_path = Path("/Applications/Tailscale.app")
    if target_app_path.exists():
        print("Tailscale is already installed.")
        exit()

    # Download the latest version zip and extract it's .app to target_app_path
    latest_url = parse_latest_url()
    # Write the file to a temporary location and extract
    with tempfile.TemporaryDirectory() as tmpdirname:
        dload.save_unzip(latest_url, tmpdirname, delete_after=True)
        tmp_app_path = Path(tmpdirname) / "Tailscale.app"
        tmp_app_path.rename(target_app_path)
