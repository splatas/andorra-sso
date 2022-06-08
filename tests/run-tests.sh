#!/bin/bash
echo INICIO en $HOSTNAME

export LOOP_COUNT=$1

# CURL TOKEN: curl -d "client_id=postman" -d "username=juan" -d "password=redhat01" -d "grant_type=password"   "http://localhost:8080/auth/realms/springboot-keycloak/protocol/openid-connect/token"  | jq -r '.access_token' 
export SSO_TOKEN=$(curl -d "client_id=postman" -d "username=juan" -d "password=redhat01" -d "grant_type=password"   "http://localhost:8080/auth/realms/springboot-keycloak/protocol/openid-connect/token"  | jq -r '.access_token' )
#echo Token obtenido: $SSO_TOKEN

export ENDPOINT='http://localhost:8081/userinfo?access_token='$SSO_TOKEN

#echo Curl a ejecutar= $ENDPOINT

for ((n=1; n<=$LOOP_COUNT; n++))    
do
    echo .
    echo Invoco el endpoint: $n
    curl --location --request GET $ENDPOINT
done

echo .
echo FIN