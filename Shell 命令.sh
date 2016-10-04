# break 命令
#!/bin/sh

rm -rf fred*
echo > fred1
echo > fred2
mkdir fred3
echo > fred4

for file in fred*
do
	if [ -d "$file" ]
	then
		break;
	fi
done

echo "first directory starting fred was $file"

rm -rf fred*

exit 0


# : 命令
#!/bin/sh

# 此处 while : 相当于 while true
while : 
do
	if [ -f "$1" ] 
	then
		echo "File exist."
	else
		break
	fi
done

exit 0

# continue 命令
#!/bin/sh

rm -rf fred*
echo > fred1
echo > fred2
mkdir fred3
echo > fred4

for file in fred*
do
	if [ -d "$file" ]
	then
		echo "skipping directory $file"
		continue
	fi
	echo "file is $file"
done

rm -rf fred*
exit 0

# . 命令：改变环境上下文
# classic_set.sh
#!/bin/sh

version = "classic"
PATH = "/usr/local/old_bin:/usr/bin:/bin:."
PS1 = "classic> "

# latest_set.sh
#!/bin/sh
 
version = "latest"
PATH = "/usr/local/new_bin:/usr/bin:/bin:."
PS1 = "latest> "

# 切换到 classic 上下文环境
#$ . ./classic_set

# 切换到 latest 上下文环境
#$ . ./latest_set


# echo 命令
echo -n "string to output"
echo -e "string to output\c"


# eval 命令
foo = 10
x = foo
y = '$'$x
echo $y # $foo

eval y = '$'$x
echo $y # 10


# exec 命令：将当前 shell 替换为一个不同的程序
exec wall "Thanks for all the fish"


# exit n 命令
exit 0   # 成功
exit 126 # 文件不可执行
exit 127 # 命令未找到
exit 128 # 出现一个信号


# exprot 命令
# export2.sh
#!/bin/sh
echo "$foo"
echo "$bar"

# export1.sh
foo = "Then first meta-syntactic variable"
# 这里变量 bar 被导出可以在其他 shell 环境中直接使用
export bar = "The second meta-syntactic variable"

#$ ./export1


# expr 命令
x = `expr $x + 1`
x = $(expr $x + 1)


# printf 命令
printf "%s\n" "hello"
# 使用双引号或者空格来区分参数
printf "%s %d\t%s" "Hi There" 15 people


# return 命令


# set 命令：为 shell 设置参数变量
#!/bin/sh

echo the date is $(date)
# $(date) 的输出值以空格为分隔符作为参数传进来
set $(date)
echo the month is $2

exit 0


# shift 命令：把所有参数变量左移一个位置，$2 变成 $1。$1将被丢弃，$0不变
#!/bin/sh
# 遍历参数
while [ "$1" != "" ];
do
	echo "$1"
	shift
done

exit 0


# trap 命令
# trap -l 查看信号列表
#!/bin/sh

trap 'rm -f /tmp/my_tmp_file_$$' INT
echo "createing file /tmp/my_tmp_file_$$"
date > /tmp/my_tmp_file_$$

echo "press interrupt (CTRL-C) to interrupt ... "
while [ -f /tmp/my_tmp_file_$$ ];
do
	echo File exists
	sleep 1
done
echo The file no longer exists

trap INT
echo createing file /tmp/my_tmp_file_$$
date > /tmp/my_tmp_file_$$

echo "press interrupt (control-C) to interrupt ..."
while [ -f /tmp/my_tmp_file_$$ ]
do
	echo File exists
	sleep 1
done

echo we never get here
exit 0


# unset 命令：把变量从环境中清除
#!/bin/sh

foo = "Hello World"
echo $foo

unset foo
echo $foo


# find 命令
find / -name test -print
find / -mount -name test -print # 不搜索挂载的其他系统目录




