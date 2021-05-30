#!/bin/sh
# set -x
key_dir="key1"
key_name="first_key"

OPENSSL="/usr/bin/openssl"

# Create the signing key if not present
if [ ! -d "${key_dir}" ]; then
	# Create the key RSA2048
        mkdir -p ${key_dir}
	 $OPENSSL genpkey -algorithm RSA -out "${key_dir}"/"${key_name}".key -pkeyopt rsa_keygen_bits:2048 -pkeyopt rsa_keygen_pubexp:65537
	 $OPENSSL req -batch -new -x509 -key "${key_dir}"/"${key_name}".key -out "${key_dir}"/"${key_name}".crt
fi

key_dir="key2"
key_name="second_key"

OPENSSL="/usr/bin/openssl"

# Create the signing key if not present
if [ ! -d "${key_dir}" ]; then
	# Create the key RSA2048
        mkdir -p ${key_dir}
	 $OPENSSL genpkey -algorithm RSA -out "${key_dir}"/"${key_name}".key -pkeyopt rsa_keygen_bits:2048 -pkeyopt rsa_keygen_pubexp:65537
	 $OPENSSL req -batch -new -x509 -key "${key_dir}"/"${key_name}".key -out "${key_dir}"/"${key_name}".crt
fi

