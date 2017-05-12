grep -r 'Job 0 finished' /home/master/mesos-work/  | grep stderr | grep -o '[0-9]\+\.[0-9]\+' | awk '{print $1}' | awk '{sum+=$1}END{print sum}'
