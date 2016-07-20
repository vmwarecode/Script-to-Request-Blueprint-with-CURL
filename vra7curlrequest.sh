export VRA=vra-01a.corp.local
export ACCEPT="application/json"
export DATA=`curl --insecure -H "Accept: application/json" -H 'Content-Type: application/json' --data '{"username":"tony@corp.local","password":"VMware1!","tenant":"vsphere.local"}' https://$VRA/identity/api/tokens`
export TOKEN=`echo $DATA | grep -o -P '(?<="id":")[\w\d=]*(?=")'`
echo $TOKEN
export AUTH="Bearer $TOKEN"
curl --insecure -H "Accept: application/json" -H "Authorization: $AUTH" https://vra-01a.corp.local/catalog-service/api/consumer/entitledCatalogItems/e2cd2087-bb96-444c-96d8-42c90ef00cef/requests --data @/tmp/CentOS6.json --verbose -H "Content-Type: application/json" | python -m json.tool

