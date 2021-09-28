#!/usr/bin/python3
"""contains function that queries the reddit api"""

from requests import get


def top_ten(subreddit):
    """returns the top 10 hot posts of a subreddit"""
    req = get(
        "https://www.reddit.com/r/{}/hot.json".format(subreddit),
        headers={
            "User-Agent": "alx_app"},
        params={
            "limit": 10},
        allow_redirects=False)
    if req.status_code != 200:
        print(None)
    else:
        posts = req.json().get("data").get("children")
        for post in posts:
            print(post.get("data").get("title"))
