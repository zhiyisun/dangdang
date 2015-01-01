#!/bin/bash - 
#===============================================================================
#
#          FILE: math.sh
# 
#         USAGE: ./math.sh 
# 
#   DESCRIPTION: This is a sciprt for my son to learn math.
# 
#       OPTIONS: ---
#  REQUIREMENTS: bash shell 
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Zhiyi Sun zhiyisun@gmail.com 
#  ORGANIZATION: Home 
#       CREATED: 01/01/2015 19:21
#      REVISION: 0.1 
#===============================================================================

set -o nounset                              # Treat unset variables as an error

doMath() {
	a=$[$RANDOM % 10]
	b=$[$RANDOM % 10]
	optVal=$[$RANDOM % 2]
	
	if [ $optVal -eq 0 ]; then
		echo -ne "$a + $b = "
		c=`expr $a + $b`
	else 
		if [ $a -ge $b ]; then
			echo -ne "$a - $b = "
			c=`expr $a - $b`
		else
			echo -ne "$b - $a = "
			c=`expr $b - $a`
		fi
	fi

	read result

	num='^[0-9]+$'
	if [[ $result =~ $num ]]; then
		if [ $result -eq $c ]; then
			sl
		else
			echo "The result is $c. You can do it better next time. :-)"
			read temp
		fi
	else
		echo "The input is incorrect. :-("
		read temp
	fi
}

while [ 1 ]
do
	clear
	doMath
done
