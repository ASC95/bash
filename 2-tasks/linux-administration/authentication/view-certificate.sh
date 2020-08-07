#!/usr/bin/env bash

# - https://stackoverflow.com/questions/9758238/how-to-view-the-contents-of-a-pem-certificate

# - Remember that SSH keys are just that: keys. It doesn't make sense to try and read the contents of a key. A *.pem certificate is an actual
#   certificate so it makes sense to view its contents
read_pem_certificate_with_keytool() {
    keytool -printcert -file <certificate>.pem
}

# - I don't know why keytool doesn't work for some (all?) certificates in the x509 certificate format, but openssl does!
read_pem_certificate_with_openssl() {
    openssl x509 -in <certificate>.pem -text
}
