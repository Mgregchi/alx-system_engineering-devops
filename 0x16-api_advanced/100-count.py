#!/usr/bin/python3
"""
a recursive function that queries the Reddit API
"""
import requests


def count_words(subreddit, word_list, after=None, count={}):
    """a recursive function that queries the Reddit API,
    parses the title of all hot articles, and prints a sorted count of given keywords (case-insensitive, delimited by spaces
    """
    if after is None:
        base_url = f"https://www.reddit.com/r/{subreddit}/hot.json"
    else:
        base_url = f"https://www.reddit.com/r/{subreddit}/hot.json?after={after}"
    
    headers = {"User-Agent": "YOUR_USER_AGENT"}
    response = requests.get(base_url, headers=headers)
    data = response.json()

    if "error" in data:
        return

    posts = data["data"]["children"]

    for post in posts:
        if post["data"]["is_self"]:
            count_words(subreddit, word_list, after=post["data"]["name"], count=count)
        else:
            count_words(subreddit, word_list, after=post["data"]["name"], count=count)
            title = post["data"]["title"]
            for word in word_list:
                word = word.lower()
                if word not in count:
                    count[word] = 0
                count[word] += title.lower().count(word)

    if not after:
        sorted_count = sorted(count.items(), key=lambda x: (-x[1], x[0]))
        for word, count in sorted_count:
            print(f"{word.lower()}: {count}")

