
#!/bin/bash

#scp -r /home/zxd/mesos-libz/ zxd@slave-0-1:~

#/home/zxd/mesos-install/sbin/mesos-stop-cluster.sh
#/home/zxd/spark-2.0.0-bin-2.6.0/sbin/stop-all.sh

cat /home/master/slaves | while read LINE
do

    #scp -r /home/zxd/spark-2.0.0-bin-2.6.0/conf root@$LINE:/home/zxd/spark-2.0.0-bin-2.6.0
      ssh -n root@$LINE 'rm -rf /home/master/mesos-log /home/master/mesos-work'
      ssh -n root@$LINE 'mkdir /home/master/mesos-work /home/master/mesos-log'
        #ssh -n root@$LINE 'rm -rf /home/zxd/mesos-install/run/*'
          echo $LINE
done
