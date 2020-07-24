#!/bin/bash
DEVLIST=`/opt/MicronTechnology/MicronMSECLI/msecli -L -d | grep "Device Name" | awk '{print $4}'`
DEVNUM=`/opt/MicronTechnology/MicronMSECLI/msecli -L -d | grep "Device Name" | wc -l`
#echo $DEVNUM

echo -e '{'
echo -e '  "data": ['
#echo -e '\t\t{'
for ((i=$DEVNUM; $i>1; i=(($i-1)) ))
do
  DEV=`echo $DEVLIST | awk -v val=$i '{print $val}'` 
  #echo $DEV
  echo -e '    {'
  echo -e '      "{#DEV_NAME}": "'$DEV'"'
  echo -e '    },'
done
echo -e '    {'
echo -e '      "{#DEV_NAME}": "'`echo $DEVLIST | awk '{print $1}'`'"'
echo -e '    }'
echo -e '  ]'
echo -e '}'
