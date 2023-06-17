#!/bin/bash

# Check if the pod exists with the specified name and image

image=`kubectl get cronjobs daily-run -n news -o jsonpath="{.spec.jobTemplate.spec.template.spec.containers[0].image}"`
schedule=`kubectl get cronjobs daily-run -n news -o jsonpath="{.spec.schedule}"`

if [ "$image" != "busybox" ]; then
    echo "CronJob does not exist with the specified image."
    exit 1
fi

if [ "$schedule" != "0 8 * * *" ]; then
    echo "CronJob does not exist with the specified schedule."
    exit 1
fi

echo "CronJob looks good"
exit 0