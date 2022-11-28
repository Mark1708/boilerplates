#!/bin/bash

curl https://api.telegram.org/bot$1/setWebhook?url=$2

echo "Done"