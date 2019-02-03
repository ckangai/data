#!/bin/bash
gcloud sql instances patch dbserver \
    --authorized-networks `wget -qO - http://ipecho.net/plain`/32
