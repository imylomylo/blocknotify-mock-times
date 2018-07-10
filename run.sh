if [ $STATS -eq 1 ]
  then
    block=$(komodo-cli -ac_name=$chain getblock $HEIGHT)
    mempool=$(komodo-cli -ac_name=$chain getmempoolinfo)
    blockinfo=$(echo $block | jq '{size, height, time}')
    totaltx=$(echo $block | jq '.tx | length')
    ttl=$(date -d '+30 seconds' +%s)
    mempoolMB=$(( $(echo $mempool | jq -r .bytes) / 1000000 ))
    RESULT=$(echo $blockinfo | jq --argjson ttl $ttl --argjson mempoolMB $mempoolMB --argjson totaltx $totaltx --arg chain $chain '. += {"totaltx":$totaltx, "ac":$chain, "ttl":$ttl, "mempoolMB":$mempoolMB}')
    echo $RESULT >> ${STATS_FILE}
    curl \
    --verbose \
    --request OPTIONS \
    ${BLOCKNOTIFYURL} \
    --header 'Origin: http://localhost:8000' \
    --header 'Access-Control-Request-Headers: Origin, Accept, Content-Type' \
    --header 'Access-Control-Request-Method: POST'
    sleep 2
    curl \
    --verbose \
    --header "Origin: http://localhost:8000" \
    --request POST \
    --data "${RESULT}" \
    ${BLOCKNOTIFYURL} &
fi

# { "size": 1586, "height": 1, "time": 1531219771, "totaltx": 1, "ac": "TXSCL002", "ttl": 1531219837, "mempoolMB": 0 }
# { "size": 1586, "height": 2, "time": 1531219811, "totaltx": 1, "ac": "TXSCL002", "ttl": 1531219852, "mempoolMB": 0 }
# { "size": 1586, "height": 3, "time": 1531219826, "totaltx": 1, "ac": "TXSCL002", "ttl": 1531219873, "mempoolMB": 0 }
# { "size": 1586, "height": 4, "time": 1531219847, "totaltx": 1, "ac": "TXSCL002", "ttl": 1531219888, "mempoolMB": 0 }
# { "size": 1586, "height": 5, "time": 1531219862, "totaltx": 1, "ac": "TXSCL002", "ttl": 1531219925, "mempoolMB": 0 }
# { "size": 1890, "height": 6, "time": 1531219899, "totaltx": 2, "ac": "TXSCL002", "ttl": 1531219930, "mempoolMB": 0 }
# { "size": 1586, "height": 7, "time": 1531219904, "totaltx": 1, "ac": "TXSCL002", "ttl": 1531219996, "mempoolMB": 0 }
# { "size": 1586, "height": 8, "time": 1531219970, "totaltx": 1, "ac": "TXSCL002", "ttl": 1531220023, "mempoolMB": 0 }
# { "size": 1586, "height": 9, "time": 1531219997, "totaltx": 1, "ac": "TXSCL002", "ttl": 1531220170, "mempoolMB": 0 }