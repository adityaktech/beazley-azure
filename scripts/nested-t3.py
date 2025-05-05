#!/usr/bin/env python3

def get_value(nested_dict, key_path):
    keys = key_path.split("/")
    val = nested_dict
    for key in keys:
        if isinstance(val, dict) and key in val:
            val = val[key]
        else:
            return None
    return val

if __name__ == "__main__":
    example1 = {"a":{"b":{"c":"d"}}}
    example2 = {"x":{"y":{"z":"a"}}}
    
    print("Result 1:", get_value(example1, "a/b/c"))  # Output: d
    print("Result 2:", get_value(example2, "x/y/z"))  # Output: a