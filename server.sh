# server side
# http://zarb.org/~gc/html/udp-in-ssh-tunneling.html


# create a fifo that needs to be open for reading/writing before data can pass
mkfifo /tmp/fifo

# listen on local 48001 and send to local 48000 
nc -l -p 48001 < /tmp/fifo | nc -u 192.168.150.50 48000 > /tmp/fifo