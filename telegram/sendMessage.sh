#!/bin/bash

curl --location --request POST "https://api.telegram.org/bot$1/sendMessage?chat_id=$2&parse_mode=HTML" \
                -d text="$3"
echo "Done"