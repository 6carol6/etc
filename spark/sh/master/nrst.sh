rm -f /home/master/start /home/master/end

grep -r 'carolz-onTaskStart' /home/master/mesos-work/  | grep stderr | grep -o '[0-9]\+\:[0-9]\+:[0-9]\+' | cat >> start

ssh -n root@server012 '/home/master/srst.sh' | cat >> start

ssh -n root@server013 '/home/master/srst.sh' | cat >> start

grep -r 'carolz-onTaskEnd' /home/master/mesos-work/  | grep stderr | grep -o '[0-9]\+\:[0-9]\+:[0-9]\+' | cat >> end

ssh -n root@server012 '/home/master/erst.sh' | cat >> end

ssh -n root@server013 '/home/master/erst.sh' | cat >> end

./calTaskNum
