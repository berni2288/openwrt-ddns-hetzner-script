# openwrt-ddns-hetzner-script

A script for updating a Hetzner DNS record with the current Openwrt WAN IP (Dyndns)


## Create a new Hetzner DNS API token

https://dns.hetzner.com/settings/api-token

## Create and find out the Zone and record IDs

Go to the Hetzner DNS console at https://dns.hetzner.com/ and create an `A` record with a TTL of `300` and name of your choice.

```sh
# Get all zones # https://dns.hetzner.com/api-docs#operation/GetZones
curl "https://dns.hetzner.com/api/v1/zones" \
     -H 'Auth-API-Token: xyz'

# Get all records https://dns.hetzner.com/api-docs#operation/GetRecords
curl "https://dns.hetzner.com/api/v1/records?zone_id={ZoneID}" \
     -H 'Auth-API-Token: xyz'
```

## Setup

Install OpenWRT ddns packages and curl:

```sh
opkg update
opkg install luci-app-ddns ddns-scripts curl
```

* Upload updatedns.conf.dist to `/etc/updatedns.conf` and change the values
* Make it readable by root user only: `chmod 0600 /etc/updatedns.conf`
* Upload updatedns.conf to `/etc/updatedns.sh` and make sure it's executable
* Configure the OpenWRT ddns service in LUCI web interface according to your needs. The value for Custom update-script needs to be `/etc/updatedns.sh`

