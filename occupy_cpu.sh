#! /bin/sh
#消耗总 CPU 核数的一半,也可以自己指定
#启动：cpu.sh >kill_cpu.sh
#停止：bash kill_cpu.sh
for i in $(seq $(expr $(cat /proc/cpuinfo |grep process |wc -l) / 2) )
do
echo -ne "
i=0;
while true
do
i=i+1;
done" | /bin/sh &
pid_array[$i]=$! ;
done

for i in "${pid_array[@]}"; do
echo 'kill ' $i ';';
done
