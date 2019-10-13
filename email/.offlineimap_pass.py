#!/usr/bin/env python2

from subprocess import check_output

def GetPassGmail():
    return check_output("/usr/local/bin/pass johngodlee@gmail.com", shell=True).splitlines()[0]

def GetPassRiseup():
    return check_output("/usr/local/bin/pass johngodlee@riseup.net", shell=True).splitlines()[0]
