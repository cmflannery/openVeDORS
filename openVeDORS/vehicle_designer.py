#!/usr/bin/env python
from future.utils import raise_from


class Rocket:
    def __init__(self, arg):
        self.arg = arg

def main():
    print('Hello python worlds 2 and 3')


if __name__ == '__main__':
    try:
        main()
    except KeyboardInterrupt:
        print('exiting due to KeyboardInterrupt')
