# 算数扩展
#!/bin/sh
x = 0
while [ "$x" -ne 10 ]
do
	echo $x
	x = $(($x + 1))
done

exit 0


# 参数扩展
#!/bin/sh

for i in 1 2
do
	my_secret_process ${i}_tmp
done

unset foo
echo ${foo:-bar}

foo = fud
echo ${foo:-bar}

foo = /usr/bin/x11/startx
echo ${foo#*/}
echo ${foo##*/}

bar = /usr/local/etc/local/networks
echo ${bar%local*}
echo ${bar%%local*}

exit 0

# 如果 param 为空，就把它设置为 default 的值
${param:-default}
# 给出 param 的长度
${#param}
# 从 param 的尾部开始删除与 word 匹配的最小部分，然后返回
${param%word}
# 从 param 的尾部开始删除与 word 匹配的最长部分，然后返回
${param%%word}
# 从 param 的头部开始删除与 word 匹配的最小部分，然后返回
${param#word}
# 从 param 的头部开始删除与 word 匹配的最长部分，然后返回
${param##word}

# 若 foo 为空，则赋值 bar 并返回
${foo:=bar}


# here 文档：用于输出大量文本
cat << EOF
This is the first line
This is the second line
EOF

# 写入已经存在的文件
touch test_file
cat > test_file << EOF
This is the first line
This is the second line
EOF

# 写入未存在的文件（或追加到末尾）
cat >> test_file << EOF
This is the first line
This is the second line
EOF


# 脚本调试
# 打开回显
set -o xtrace
set -o noexec
set -o verbose
set -o nounset
# 关闭回显
set +o xtrace
set +o noexec
set +o verbose
set +o nounset
