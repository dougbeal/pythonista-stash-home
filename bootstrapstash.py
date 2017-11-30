GITHUB_USER="dougbeal"
url = "https://raw.githubusercontent.com/%s/stash/local/getstash.py" % (GITHUB_USER)
import requests as r; exec(r.get(url).text)
