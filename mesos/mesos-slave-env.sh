# This file contains environment variables that are passed to mesos-agent.
# To get a description of all options run mesos-agent --help; any option
# supported as a command-line option is also supported as an environment
# variable.

# You must at least set MESOS_master.

# The mesos master URL to contact. Should be host:port for
# non-ZooKeeper based masters, otherwise a zk:// or file:// URL.
export MESOS_master=10.0.0.22:5050
IP=`ifconfig eth0 | head -2 | tail -1 | awk '{print $2}' | grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}'`
export MESOS_ip=${IP}
export MESOS_hadoop_home=/home/zxd/hadoop/hadoop-2.6.2/

# Other options you're likely to want to set:
export MESOS_log_dir=/home/zxd/mesos-install/log
export MESOS_work_dir=/home/zxd/mesos-install/run
# export MESOS_isolation=cgroups
