"""A simple Python script that prints a greeting message and the current working directory."""

import os


def hello() -> str:
    """Return a greeting message.

    Returns
    -------
        A greeting message.
    """
    return "Hello, World!"


def main():
    """Execute the script."""
    print(hello())
    print(f"Current working directory: {os.getcwd()}")
