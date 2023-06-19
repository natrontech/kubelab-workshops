#!/bin/bash

# Check if the pod exists with the specified name and image

image=`kubectl get cronjobs release -n development -o jsonpath="{.spec.jobTemplate.spec.template.spec.containers[0].image}"`
schedule=`kubectl get cronjobs release -n development -o jsonpath="{.spec.schedule}"`
successfulJobsHistoryLimit=`kubectl get cronjobs release -n development -o jsonpath="{.spec.successfulJobsHistoryLimit}"`

if [ "$image" != "nginx" ]; then
    echo "CronJob does not exist with the specified image."
    exit 1
fi

if [ "$schedule" != "45 3 1 * *" ]; then
    echo "CronJob does not exist with the specified schedule."
    exit 1
fi

if [ "$successfulJobsHistoryLimit" != 6 ]; then
    echo "CronJob does not exist with the specified successfulJobsHistoryLimit."
    exit 1
fi

echo "CronJob looks good"
exit 0