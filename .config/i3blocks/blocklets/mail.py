#!/usr/bin/env python3
import imaplib
import sys
'''Passwords and Users are read from file (passfile.py) for dotfile syncing sake :)
accX_user = 'username'
accX_password = 'password'
accX_smtp = 'smtp.server.xy'
'''
from passfile import *

def write(message):
  sys.stdout.write(message)
  sys.stdout.flush()

class Mail1():
    def __init__(acc1):
        acc1.M = imaplib.IMAP4_SSL(acc1_smtp, '993')
        acc1.M.login(acc1_user, acc1_password)

    def checkMail(acc1):
        acc1.M.select()
        acc1.unRead = acc1.M.search(None, 'UnSeen')
        return len(acc1.unRead[1][0].split())

    def readMail(acc1):
        acc1.M.select()
        typ ,data = acc1.M.search(None,'UnSeen')
        for num in data[0].split():
            acc1.M.store(num, '+FLAGS', '\Seen')

class Mail2():
    def __init__(acc2):
        acc2.M = imaplib.IMAP4_SSL(acc2_smtp, '993')
        acc2.M.login(acc2_user, acc2_password)

    def checkMail(acc2):
        acc2.M.select()
        acc2.unRead = acc2.M.search(None, 'UnSeen')
        return len(acc2.unRead[1][0].split())

    def readMail(acc2):
        acc2.M.select()
        typ ,data = acc2.M.search(None,'UnSeen')
        for num in data[0].split():
            acc2.M.store(num, '+FLAGS', '\Seen')

email1 = Mail1()
email2 = Mail2()

if __name__ == '__main__':
    command = sys.argv[1]

    if command == 'set-seen':
        email1.readMail()
        email2.readMail()
    elif command == 'get-unseen':
        if email1.checkMail() >= int('1'):
            print ("<span color='#4cb9dd'> </span>","<span color='#707070'>",email1.checkMail() + email2.checkMail()," </span>")
        elif email2.checkMail() >= int('1'):
            print ("<span color='#4cb9dd'> </span>","<span color='#707070'>",email2.checkMail()," </span>")
        else:
            print ("<span color='#b3b3b3'> </span>","<span color='#b3b3b3'>",email1.checkMail() + email2.checkMail()," </span>")
    else:
        write('Usage: ' + sys.argv[0] + ' [set-seen|get-unseen]\n')
