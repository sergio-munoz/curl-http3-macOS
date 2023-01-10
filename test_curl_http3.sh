#!/bin/bash

# Check curl has http3
if curl --version| grep -q "HTTP3"; then
    echo Curl with HTTP3 intalled correctly.
else
    printf "Curl has no HTTP3 capabilities.\nPlease run ./install_curl_http3.sh\n"
fi

# PubNub's HTTP3 time request
echo "Testing curl HTTP3 with PubNub's Timetoken api..."
PN_TIME=$(curl -s --http3 https://d13ddxylvjzgk0.cloudfront.net/time/0)

# Clean and convert PubNub's timetoken to unix time
PN_TIME=$(echo $PN_TIME | cut -d "[" -f2 | cut -d "]" -f1)
PN_TIME=$(($PN_TIME/10000000))
PN_TIME=$(date -r $PN_TIME)

echo "Time provided by PubNub: $PN_TIME"
