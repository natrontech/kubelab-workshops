#!/bin/bash

# Check if the pod exists with the specified name and image

image=`kubectl get cronjobs get-up -n alarm -o jsonpath="{.spec.jobTemplate.spec.template.spec.containers[0].image}"`
schedule=`kubectl get cronjobs get-up -n alarm -o jsonpath="{.spec.schedule}"`

if [ "$image" != "nginx" ]; then
    echo "CronJob does not exist with the specified image."
    exit 1
fi

if [ "$schedule" != "0 6 * * 1-5" ]; then
    echo "CronJob does not exist with the specified schedule."
    exit 1
fi

echo "CronJob looks good"
exit 0