#!/bin/sh
set -o errexit

ip="$1"

. /etc/updatedns.conf

echo "[$0] Updating Hetzner DNS record to $ip"
curl --request "PUT" "https://dns.hetzner.com/api/v1/records/$hetzner_dns_record_id" \
     --header 'Content-Type: application/json' \
     --header "Auth-API-Token: $hetzner_dns_api_token" \
     --data '{
  "value": "'$ip'",
  "ttl": 300,
  "type": "A",
  "name": "'$hetzner_dns_name'",
  "zone_id": "'$hetzner_dns_zone_id'"
}'
echo "[$0] Hetzner DNS update sucessfully finished"
