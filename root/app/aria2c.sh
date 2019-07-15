#! /bin/bash -eu

RPC=""
if [ -n "${RPC_SECRET:-}" ]; then 
  RPC="--rpc-secret="$RPC_SECRET
fi

if [ "$SSL" = "true" ]; then
echo "Start aria2 with secure config"

/usr/bin/aria2c --conf-path="/app/conf/aria2.conf" \
--enable-rpc --rpc-listen-all \
--rpc-certificate=/app/conf/key/aria2.crt \
--rpc-private-key=/app/conf/key/aria2.key \
--rpc-secure \
$RPC

else

echo "Start aria2 with standard mode"
/usr/bin/aria2c --conf-path="/app/conf/aria2.conf" --enable-rpc --rpc-listen-all $RPC

fi