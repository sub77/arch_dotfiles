#!/usr/bin/env python
while(1):
    s = str(input())
    if (len(s) > 80):
        s = s[:35] + '...' + s[-35:]
    print(s)
