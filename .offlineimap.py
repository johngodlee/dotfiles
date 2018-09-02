#!/usr/bin/env python

from subprocess import check_output

def get_pass():
    return check_output("/usr/local/bin/pass email/johngodlee@gmail.com", shell=True).splitlines()[0]


