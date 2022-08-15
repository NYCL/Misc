#!/bin/bash
tunnel_list=""
filename=tunnel_list

while read line; do
    tunnel_list="$tunnel_list -L $line "
done < $filename

eval sudo gcloud compute ssh --project $PROJECT_ID --zone $ZONE $GCLOUD_SERVER -- -p $GCLOUD_PORT $tunnel_list "watch -n 30 date"

exit 0
