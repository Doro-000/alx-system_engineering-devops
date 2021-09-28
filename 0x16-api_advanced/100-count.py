#!/usr/bin/python3
"""contains function that queries the reddit api"""

from requests import get


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
                w_count = title.split().count(word)
                if count_dict.get(word):
                    count_dict[word] += w_count
                else:
                    count_dict[word] = w_count
        if req.json().get("data").get("after"):
            count_words(
                subreddit,
                word_list=word_list,
                count_dict=count_dict,
                after=req.json().get("data").get("after"))
        else:
            for pair in sorted(
                    count_dict.items(),
                    key=lambda kv: (
                        kv[1],
                        kv[0]),
                    reverse=True):
                if pair[1]:
                    print("{}: {}".format(pair[0].strip(), pair[1]))
