#!/bin/bash
#add fix to exercise6-fix here
if [ `hostname` == "server1" ]; then
        transfer_host="server2"
else
        transfer_host="server1"
fi

echo “Array of args are ” $@

files_to_copy=${@:1:$#-1}
directory_to_copy=${!#}

scp -i ~/.ssh/private_key $files_to_copy vagrant@$transfer_host:$directory_to_copy

echo `stat --printf="%s" ${@:1:$#-1}`

