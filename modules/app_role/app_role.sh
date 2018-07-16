#!/bin/bash

# Exit if any of the intermediate steps fail
set -e


# jq will ensure that the values are properly quoted
# and escaped for consumption by the shell.
eval "$(jq -r '@sh "ROLE_ID=\(.role_id) VAULT_ADDR=\(.address) SECRET_ID=\(.secret_id)"')"


VAULT_TOKEN=$(vault write -field=token auth/approle/login role_id=${ROLE_ID} secret_id=${SECRET_ID} -format=json)
# Safely produce a JSON object containing the result value.
# jq will ensure that the value is properly quoted
# and escaped to produce a valid JSON string.
jq -n --arg vault_token "$VAULT_TOKEN" '{"token":$vault_token}'