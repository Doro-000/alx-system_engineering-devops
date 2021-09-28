#!/usr/bin/python3
from requests import get
"""contains function that queries the reddit api"""


def count_words(subreddit, word_list, count_dict={}, after=None):
    """parses the title of all hot articles
    and prints a sorted count of given keywords"""
    params = {"limit": 50}
    if after:
        params["after"] = after
    req = get(
        "https://www.reddit.com/r/{}/hot.json".format(subreddit),
        headers={
            "User-Agent": "alx_app"},
        params=params,
        allow_redirects=False)
    if req.status_code == 200:
        posts = req.json().get("data").get("children")
        for post in posts:
            title = post.get("data").get("title")
            word_list = [word.lower() for word in word_list]
            for word in word_list:
                count = title.split().count(word)
                if count_dict.get(word):
                    count_dict[word] += count
                else:
                    count_dict[word] = count
        if req.json().get("data").get("after"):
            count_words(
                subreddit,
                word_list=word_list,
                count_dict=count_dict,
                after=req.json().get("data").get("after"))
        else:
            for pair in sorted(
                    count_dict,
                    key=lambda kv: (
                        kv[1],
                        kv[0]),
                    reversed=True):
                print(pair[0], ": ", pair[1])