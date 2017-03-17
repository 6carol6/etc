# This file contains environment variables that are passed to mesos-master.
# To get a description of all options run mesos-master --help; any option
# supported as a command-line option is also supported as an environment
# variable.

IP=`ifconfig eth0 | head -2 | tail -1 | awk '{print $2}' | grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}'`
export MESOS_ip=${IP}

# Some options you're likely to want to set:
export MESOS_log_dir=/home/zxd/mesos-log
export MESOS_work_dir=/home/zxd/mesos-run
