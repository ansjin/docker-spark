#!/bin/bash

export SPARK_MASTER_HOST=`hostname`

. "/usr/local/spark/sbin/spark-config.sh"

. "/usr/local/spark/bin/load-spark-env.sh"

mkdir -p $SPARK_MASTER_LOG

export SPARK_HOME=/usr/local/spark

ln -sf /dev/stdout $SPARK_MASTER_LOG/spark-master.out

cd /usr/local/spark/bin && /usr/local/spark/sbin/../bin/spark-class org.apache.spark.deploy.master.Master \
    --ip $SPARK_MASTER_HOST --port $SPARK_MASTER_PORT --webui-port $SPARK_MASTER_WEBUI_PORT >> $SPARK_MASTER_LOG/spark-master.out
