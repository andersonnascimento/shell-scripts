#!/usr/bin/env bash

args=("$*")

RETRY_COUNT=1;
RETRIES=20;

execute_command(){
	{
		#echo ${args};
		#echo "Starging push"
		eval ${args}
	} || {
		if [ ${RETRY_COUNT} -lt ${RETRIES} ]; then 
			let RETRY_COUNT=$RETRY_COUNT+1;
			echo "Trying for the ${RETRY_COUNT} time.";
			execute_command;
		else		
			echo "Could not push try again in few minutes."
			exit 1;
		fi
	}
}

execute_command

