# telegram

## Using
1. Running the script `sendDocument.sh`
```bash
sh path/sendDocument.sh <TOKEN> <CHAT_ID> <PATH_TO_FILE> <CAPTION>
```
2. Running the script `sendMessage.sh`
```bash
sh path/sendMessage.sh <TOKEN> <CHAT_ID> <MESSAGE>
```
2. Running the script `initWebhook.sh`
```bash
sh path/initWebhook.sh <TOKEN> <URL>
```

## Example of use in other scripts 
1. Fail2ban Report
```bash
#!/bin/bash

argv="$1"
[ -z "${argv}" ] && current_date=$(date +"%Y-%m-%d") || current_date=$1

ban=$(grep -e ${current_date} -e " Ban " /var/log/fail2ban.log | wc -l)
try_auth=$(grep -e ${current_date} -e " Found " /var/log/fail2ban.log | wc -l)
unique_ip=$(grep -e 'Found' -e ${current_date} /var/log/fail2ban.log | grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}' | uniq -c | wc -l)

result="${current_date} \ncount of ban: ${ban}\ncount of incorrect auth: ${try_auth}\nunique ip: ${unique_ip}"
resultHTML="<b>${current_date}</b>%0Acount of ban: <b>${ban}</b>%0Acount of incorrect auth: <b>${try_auth}</b>%0Aunique ip: <b>${unique_ip}</b>"

echo ${result}

TOKEN=<TOKEN>
declare -a chat_ids=("<CHAT_ID_1>" "<CHAT_ID_2>" "<CHAT_ID_3>")

for chat_id in "${chat_ids[@]}"
do
	bash /path/sendMessage.sh \
		"${TOKEN}" \
		$chat_id \
		"${resultHTML}"
done
```
2. Statistics Report
```bash
#!/bin/bash

TOKEN=<TOKEN>
CHAT_ID=<CHAT_ID>
CAPTION="#statistics_notification"
PATH="path/statistics.csv"

/bin/bash ${home_dir}/scripts/sendDocument.sh \
		${TOKEN} \
		${CHAT_ID} \
		${PATH} \
		${CAPTION}
```