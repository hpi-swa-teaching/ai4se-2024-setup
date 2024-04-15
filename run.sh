#!/bin/bash

# !!! SET AI_GROUP TO YOUR GROUP NUMBER (1 - 8) 
# !!! SET AI_LOGIN TO YOUR CHOSEN ACCESS TOKEN FOR THE NOTEBOOK
export AI_GROUP=1
export AI_LOGIN=set_notebook_password

if [[ $# -eq 1 ]] ; then
	echo "Using group $1 from command line"
	export AI_GROUP=$1;
fi

if [[ $# -eq 2 ]] ; then
	echo "Using group $1 and login token from command line"
	export AI_GROUP=$1
	export AI_LOGIN=$2;
fi

# This is automatically computed
export AI_GPU=$((AI_GROUP % 4))
export AI_PORT=$((8000 + AI_GROUP))
export AI_CONTAINER_NAME=ai4se-$AI_GROUP

export AI_CACHE_DIR=/var/opt/huggingface

echo "Creating container for group $AI_GROUP using GPU $AI_GPU at port $AI_PORT"

docker run -d --name ai4se-$AI_GROUP --gpus "device=$AI_GPU" -p 0.0.0.0:$AI_PORT:8888 \
	-v ~/workspace:/workspace \
	-v $AI_CACHE_DIR:/root/.cache/huggingface \
	-e LOGIN=$AI_LOGIN \
	ai4se

echo "URL: http://delos.eaalab.hpi.uni-potsdam.de:$AI_PORT/lab"
echo "This container is named $AI_CONTAINER_NAME"
echo "Stop: docker stop $AI_CONTAINER_NAME"
echo "Start: docker start $AI_CONTAINER_NAME"
echo "Remove: docker rm $AI_CONTAINER_NAME"
echo "Rebuild: (run this script)"
