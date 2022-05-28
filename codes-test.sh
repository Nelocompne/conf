#/bin/bash
cat /proc/cpuinfo | grep -m 1 "model name"
echo "Doing AES-128-GCM speedtest...(For General TLS with AES-NI CPU speed test)"
openssl speed -evp aes-128-gcm | tee /tmp/aes.log>/dev/null
aesresult=$(tail -n 1 /tmp/aes.log)
echo "AES-128-GCM speedtest Finished!"
echo "Doing chacha20 speedtest...(For General TLS without AES-NI CPU speed test or WireGuard encrypt speed test)"
openssl speed -evp chacha20 | tee /tmp/chacha.log>/dev/null
chacharesult=$(tail -n 1 /tmp/chacha.log)
echo "chacha20 speedtest Finished!"
#echo -n "$cpumodel$aesresult\n$chacharesult\n"| base64
echo -e "--- BEGIN RESULT ---\n"
echo -e "$cpumodel\n$aesresult\n$chacharesult\n"
echo -e "--- END RESULT ---\n"
rm /tmp/aes.log /tmp/chacha.log -f
