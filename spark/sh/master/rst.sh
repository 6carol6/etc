master=`grep -r 'Job 0 finished' /home/master/mesos-work/  | grep stderr | grep -o '[0-9]\+\.[0-9]\+' | awk '{print $1}' | awk '{sum+=$1}END{print sum}'`

server012=`ssh -n root@server012 '/home/master/result.sh'`

server013=`ssh -n root@server013 '/home/master/result.sh'`

#server012=\`ssh -n root@server012 ' grep -r \'Job 0 finished\' /home/master/mesos-work/  | grep stderr | grep -o \'[0-9]\+\.[0-9]\+\'| awk '{print $1}' | awk '{sum+=$1}END{print sum}'\'\`

#server013=`ssh -n root@server012 'grep -r "Job 0 finished" /home/master/mesos-work/  | grep stderr | grep -o "[0-9]\+\.[0-9]\+"| awk '{print $1}' | awk '{sum+=$1}END{print sum}''`

if test -z "$master"
  then
    master=0.0
    fi

    if test -z "$server012"
      then
        server012=0.0
        fi

        if test -z "$server013"
          then
            server013=0.0
            fi

#avg=$(awk 'BEGIN{print 1.0+2.0}')

echo "($master+$server012+$server013)" | bc

