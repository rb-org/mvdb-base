
#!/bin/bash


# Variables 

LOCAL_IPV4=`curl curl http://169.254.169.254/latest/meta-data/local-ipv4 2> /dev/null`
PUBLIC_DNSNAME=`curl http://169.254.169.254/latest/meta-data/public-hostname 2> /dev/null`
LOCAL_DNSNAME=`curl http://169.254.169.254/latest/meta-data/local-hostname 2> /dev/null`
HOSTNAME=`echo $LOCAL_DNSNAME | cut -d. -f 1`
DTAP="${dtap}"

# Add the local hostname to /etc/hosts
echo "$LOCAL_IPV4 $HOSTNAME $LOCAL_DNSNAME" | sudo tee /etc/hosts

# Update OS and install NTP client
sudo yum update -y
