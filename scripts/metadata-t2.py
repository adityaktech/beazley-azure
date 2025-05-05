#!/usr/bin/env python3

import requests
import sys
import json

BASE_URL = "http://x.x.x.x/latest/meta-data/"

def fetch_metadata(path=""):
    response = requests.get(BASE_URL + path)
    if response.status_code != 200:
        return None
    content = response.text
    if "/" in content:
        return {item: fetch_metadata(path + item + "/") for item in content.split("\n")}
    return content

def get_specific_key(key_path):
    keys = key_path.strip("/").split("/")
    metadata = fetch_metadata()
    for key in keys:
        if isinstance(metadata, dict) and key in metadata:
            metadata = metadata[key]
        else:
            return None
    return metadata

if __name__ == "__main__":
    if len(sys.argv) > 1:
        print(json.dumps(get_specific_key(sys.argv[1]), indent=2))
    else:
        print(json.dumps(fetch_metadata(), indent=2))