# server side
# http://zarb.org/~gc/html/udp-in-ssh-tunneling.html
# https://en.wikipedia.org/wiki/Netcat


# create a fifo that needs to be open for reading/writing before data can pass
rm /tmp/fifo
mkfifo /tmp/fifo

# listen on local 48001 and send to local 48000 
nc -l -p 48001 < /tmp/fifo | nc -u 192.168.150.50 48000 > /tmp/fifo