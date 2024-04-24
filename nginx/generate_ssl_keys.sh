#!/bin/bash

# Directory to store SSL keys
SSL_DIR="/etc/ssl/"

# Ensure the SSL directory exists
mkdir -p $SSL_DIR

# Generate SSL key and certificate
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $SSL_DIR/localhost.key -out $SSL_DIR/localhost.crt -subj "/C=US/ST=Washington/L=Seattle/O=DigitalWishesCorporation/OU=Development/CN=localhost"

# Combine key and certificate into a single file
cat $SSL_DIR/localhost.key $SSL_DIR/localhost.crt > $SSL_DIR/localhost.pem
