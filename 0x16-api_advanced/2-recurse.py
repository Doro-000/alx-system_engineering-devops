#!/usr/bin/python3
"""contains function that queries the reddit api"""

from requests import get


def recurse(subreddit, hot_list=[], after=None):
    """returns the a list of all hot posts of a subreddit"""
    params = {"limit": 50}
    if after:
        params["after"] = after
    req = get(
        "https://www.reddit.com/r/{}/hot.json".format(subreddit),
        headers={
            "User-Agent": "alx_app"},
        params=params,
        allow_redirects=False)
    if req.status_code != 200:
        return None
    else:
        posts = req.json().get("data").get("children")
        for post in posts:
            hot_list.append(post.get("data").get("title"))
        if req.json().get("data").get("after"):
            return recurse(
                subreddit,
                hot_list=hot_list,
                after=req.json().get("data").get("after"))
        else:
            return hot_list
