#!/bin/bash
#!/bin/bash

PATH="@\"$3\""
/bin/curl --location --request POST "https://api.telegram.org/bot$1/sendDocument?chat_id=$2&parse_mode=HTML" \
                --form "document=${PATH}" --form "caption=$4"
echo "Done"