# client side
# http://zarb.org/~gc/html/udp-in-ssh-tunneling.html

# create a SSH tunnel on port 48001 between local and remote server
ssh -nNT -L 48001:localhost:48001 corey@192.168.150.50

# create a fifo that needs to be open for reading/writing before data can pass
rm /tmp/fifo
mkfifo /tmp/fifo

# listen on local 48000 and send to local 48001 (which is picked up by SSH and forwarded)
sudo nc -l -u -p 48000 < /tmp/fifo | nc localhost 48001 > /tmp/fifo

echo "listening on UDP 48000, forwarding to 48001 on server"