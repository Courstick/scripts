#/bin/sh
# 内存消耗，消耗服务器剩余可用内存的一半，删除 /tmp/memory/block 文件，即可释放内存
mkdir /tmp/memory
memory_size=$(expr $(free -g| awk '{print $NF}' | head -n 2 |tail -n 1) / 2)
if [ $memory_size -gt 2 ];then
mount -t tmpfs -o size=${memory_size}g tmpfs /tmp/memory
dd if=/dev/zero of=/tmp/memory/block
fi
