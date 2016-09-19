# server side
# http://zarb.org/~gc/html/udp-in-ssh-tunneling.html
# https://en.wikipedia.org/wiki/Netcat


# create a fifo that needs to be open for reading/writing before data can pass
rm /tmp/fifo
mkfifo /tmp/fifo

# listen on local 48001 and send to local 48000 
# service running at 48000 needs to be already started!
nc -l 9000 < /tmp/fifo | nc -u localhost 48000 > /tmp/fifo

echo "listening on port 9000, forwarding to UDP 48000"