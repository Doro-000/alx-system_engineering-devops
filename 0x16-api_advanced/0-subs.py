#!/usr/bin/python3
"""contains function that queries the reddit api"""

from requests import get


def number_of_subscribers(subreddit):
    """returns number of subs for a subreddit"""
    sub = get("https://www.reddit.com/r/{}/about.json".format(subreddit),
              headers={"User-Agent": "alx_app"}, allow_redirects=False)
    if sub.status_code != 200:
        return 0
    return sub.json().get("data").get("subscribers")
