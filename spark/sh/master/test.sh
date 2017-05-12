../del.sh

for i in {1..1}
do
  ./bin/spark-submit --class org.apache.spark.examples.SparkPageRank --deploy-mode cluster --master mesos://114.212.83.29:7077 --conf spark.default.parallelism=8 --conf spark.executor.cores=1 --conf spark.mesos.coarse=true --conf spark.shuffle.service.enabled=true --conf spark.dynamicAllocation.enabled=true --conf spark.dynamicAllocation.executorIdleTimeout=60s --conf spark.dynamicAllocation.initialExecutors=8 --conf spark.dynamicAllocation.minExecutors=1 --conf spark.mesos.offerinterval=8000 --conf spark.dynamicAllocation.schedulerBacklogTimeout=10s hdfs://114.212.83.29:9000/user/original-spark-examples_2.11-2.0.0.jar hdfs://114.212.83.29:9000/user/pagerank_10.txt 20
#  sleep 0.01
done

#sleep 60

#master=`grep -r 'Job 0 finished' /home/master/mesos-work/  | grep stderr | grep -o '[0-9]\+\.[0-9]\+' | awk '{print $1}' | awk '{sum+=$1}END{print sum}'`

#server012=`ssh -n root@server012 '/home/master/result.sh'`

#server013=`ssh -n root@server013 '/home/master/result.sh'`

#server012=\`ssh -n root@server012 ' grep -r \'Job 0 finished\' /home/master/mesos-work/  | grep stderr | grep -o \'[0-9]\+\.[0-9]\+\'| awk '{print $1}' | awk '{sum+=$1}END{print sum}'\'\`

#server013=`ssh -n root@server012 'grep -r "Job 0 finished" /home/master/mesos-work/  | grep stderr | grep -o "[0-9]\+\.[0-9]\+"| awk '{print $1}' | awk '{sum+=$1}END{print sum}''`

#if test -z "$master"
#then
#  master=0.0
#fi

#if test -z "$server012"
#then
#  server012=0.0
#fi

#if test -z "$server013"
#then
#  server013=0.0
#fi

#avg=$(awk 'BEGIN{print 1.0+2.0}')

#echo "($master+$server012+$server013)" | bc

