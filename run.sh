#!/bin/bash
BLOCKNOTIFYURL=https://njeitldkqc.execute-api.ap-southeast-2.amazonaws.com/v0/blocknotify
STATS=1
height=1
mempool=0
size=1586
time=`date +%s`
totaltx=1
ac="TXSCL002"
ttl=$((time+50))
RESULT="{\"size\": ${size}, \"height\": ${height}, \"time\": ${time}, \"totaltx\": 1, \"ac\": \"${ac}\", \"ttl\": ${ttl}, \"mempoolMB\": ${mempool}}"
echo ${RESULT}
echo ${BLOCKNOTIFYURL}
sleep 1
for i in `seq 1 64`;
do
  echo `"obase=16; ${i}" | bc`
done
exit
if [ $STATS -eq 1 ]
  then
    # echo $RESULT >> ${STATS_FILE}
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
    --data "{ \"size\": ${size}, \"height\": ${height}, \"time\": ${time}, \"totaltx\": 1, \"ac\": \"${ac}\", \"ttl\": ${ttl}, \"mempoolMB\": ${mempool}}" \
    ${BLOCKNOTIFYURL} #&
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