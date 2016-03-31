#!/bin/bash

GLM_SERVER="https://glm.genesis.wf"
GLM_SERVER_API_KEY="77777777-fd5f-48ad-f94d-8fce86c8f5e1"

DBNAME=$1
DBUSER=$2
DBHOST=$3

DBNAME=${DBNAME:=genesis}
DBUSER=${DBUSER:=postgres}
DBHOST=${DBHOST:=localhost}


PRINT() {
  echo -e "\033[1m+++ $1\033[0m"
}

echo
PRINT "Initializing license request ..."
echo
PRINT "GLM_SERVER:\t\t $GLM_SERVER"
PRINT "DBNAME:\t\t $DBNAME"
PRINT "DBUSER:\t\t $DBUSER"
PRINT "DBHOST:\t\t $DBHOST"
echo


# get developer's public key
PUB_KEY=$(openssl rsa -in ~/.ssh/id_rsa -pubout)

# replace newlines for JSON compatibility
PUB_KEY_S=${PUB_KEY//$'\n'/\\n}

# get model hash of loacal DB
MODEL_HASH=$(psql -h $DBHOST -P pager=off  -Atc  "SELECT get_model_hash();" $DBNAME $DBUSER)

# get timestamp for request validation
TIMESTAMP=$(date +"%s")


# sign the request
SIGNATURE=$(echo -n "$TIMESTAMP" | openssl dgst -sha1  -sign ~/.ssh/id_rsa | base64)


# replace newlines for JSON compatibility
 SIGNATURE_S=${SIGNATURE//$'\n'/\\n}

echo
PRINT "Sending request"
echo '{"p_argv":{"pub_key":"'"$PUB_KEY_S"'","model_hash":"'"$MODEL_HASH"'","timestamp":'"$TIMESTAMP"',"signature":"'"$SIGNATURE"'"}}'

# request initial license
LIC=$(curl -m 5 \
-H "x-apikey:$GLM_SERVER_API_KEY" \
-H "Content-Type: application/json;charset=UTF-8" \
-X POST \
$GLM_SERVER/registry_request_initial_license/action/execute.json \
-d '{"p_argv":{"pub_key":"'"$PUB_KEY_S"'","model_hash":"'"$MODEL_HASH"'","timestamp":'"$TIMESTAMP"',"signature":"'"$SIGNATURE_S"'"}}')

echo
PRINT "Result"
echo $LIC
echo

if [[ $LIC =~ "next_request_key" ]] ; then
  RESULT=$(psql -h $DBHOST -P pager=off  -Atc  "TRUNCATE system.license; SELECT system_license_create(1, '$LIC'::JSON->'result');" $DBNAME $DBUSER)
  if [ $? -eq 0 ] ; then
    PRINT "++++++++++++++++++++++"
    PRINT "Activation successfull"
    PRINT "++++++++++++++++++++++"
  else
    echo
    PRINT "Try again with:"
    PRINT "curl -sSL $GLM_SERVER/scripts/genesis-activation.sh | bash -s $DBNAME $DBUSER $DBHOST"
  fi
else
  PRINT "Activation failed!"
  echo
  PRINT "Try again with:"
  PRINT "curl -sSL $GLM_SERVER/scripts/genesis-activation.sh | bash -s $DBNAME $DBUSER $DBHOST"
fi

echo

