ls my_{finger, toe}s

more $(grep -l POSIX *)

grep -l POSIX * | more

file /bin/bash

# 简单的 Shell 脚本
# !/bin/sh
for file in *
do
	if grep -q POSIX $file
	then
		echo $file
	fi
done

exit 0


# 将用户的输入赋值给变量 salutation
read salutation
echo $salutation

# 常用的系统环境变量
echo $HOME
echo $PATH
echo $PS1 # 命令提示符
echo $PS2 # 二级提示符
echo $IFS # 输入域分隔符
echo $0   # Shell 脚本名字
echo $#   # 传递给脚本的参数个数
echo $$   # Shell 脚本的进程号

echo $*   # 所有参数（受 IFS 参数的影响）
echo $@   # 所有参数（不受 IFS 参数的影响）

# test 命令：检查一个文件是否存在
if test -f fred.c
then
	echo "Exist."
fi

if [ -f fred.c ]
then 
	echo "Exist."
fi

if [ -d /bin/bash ]
then
	echo "/bin/bash is a directory."
else 
	echo "/bin/bash is not a directory"
fi


# 条件控制语句
#!/bin/sh

echo "Is it morning? Please answer yes or no:"
read timeofday

if [ "$timeofday"="yes" ]
then
	echo "Good morning"
elif [ "$timeofday"="no" ]
then
	echo "Good afternoon"
else
	echo "Sorry, Internal error."
	echo 1
fi

exit 0

# 不带换行符的输出
echo -n "Output with no newline"

# for 循环
#!/bin/sh

for foo in bar fud 43
do
	echo $foo
done
exit 0


#!/bin/sh
for file in $(ls f*.sh)
do
	lpr $file
done
exit 0


# while 循环
#!/bin/sh

echo "Enter password"
read trythis

while [ "$trythis" != "secret" ];
do 
	echo "Sorry, try again!"
	read trythis
done
exit 0


# until 循环
#!/bin/sh

until who | grep "$1" > /dev/null
do
	sleep 60
done

echo -e '\a'
echo "**** $1 has just logged in ****"

exit 0


# case 语句
#!/bin/sh

echo "Is it morning? Please answer yes or no"
read timeofday

case "$timeofday" in
	yes) echo "Good Morning";;
	no ) echo "Good Afternoon";;
	y  ) echo "Good Morning";;
	n  ) echo "Good Afternoon";;
	*  ) echo "Internal error.";;

	# 合并匹配模式版本
	yes | y | Yes | YES) echo "Good Morning";;
	n* | N*)             echo "Good Afternoon";;
	*)                   echo "Internal error."

	# 执行多条语句
	yes | Y | Yes | YES)
		echo "Good Morning"
		echo "Up bright and early this morning"
		;;
	[nN]*)
		echo "Good Afternoon"
		;;
	*)
		echo "Sorry, answer not recognized"
		echo "Please answer yes or no"
		exit 1
		;;
esac

exit 0
 

# AND 列表
#!/bin/sh

touch file_one

rm -f file_two

if [ -f file_one ] && echo "hello" && [ if file_two ] && echo " there"
then
	echo "in if"
else
	echo "in else"
fi

exit 0


# OR 列表
#!/bin/sh

rm -f file_one

if [ -f file_one ] || echo "hello" || echo " there"
then
	echo "in if"
else 
	echo "in else"
fi

exit 0


# 语句块
get_confirm && {
	grep -v "$cdcatnum" $tracks_file > $temp_file
	cat $temp_file > $tracks_file
	echo
	add_record_tracks
}


# 函数
#!/bin/sh

foo() {
	echo "Function foo is executing"
}

echo "script starting"
foo
echo "script ended"

exit 0

# 函数局部变量
#!/bin/sh

sample_text="global variable"

foo() {
	local sample_text="local variable"
	echo "Function foo is executing"
	echo $sample_text
}

echo "script starting"
echo $sample_text

foo

echo "script ended"
echo $sample_text


# 从函数中返回参数
#!/bin/sh

yes_or_no() {
	echo "Is your name $* ?"
	while true
	do 
		echo -n "Enter yes or no: "
		read x
		case "$x" in
			y | yes) return 0;;
			n | no ) return 1;;
			*      ) echo "Answer yes or no"
		esac
	done
}

echo "Original parameters are $*"

if yes_or_no "$1"
then
	echo "Hi $1, nice name"
else
	echo "Never mind"
fi

exit 0
