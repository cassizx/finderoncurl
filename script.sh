#!/bin/bash
if [ testscriptfile.log = true ]
	then
		echo > /dev/null
	else
		touch testscriptfile.log
fi

f=$(date '+%a %b %e  %T %Z %Y')': Started'

if [ $# = 4 ]
	then	
		echo '<----->' >> testscriptfile.log 
		echo $f >> testscriptfile.log
			if [[ $1 = ftp://* ]]|| [[ $1 = http://* ]]|| [[ $1 = https://* ]]
				then
					echo $1 && echo $1>> testscriptfile.log
				else
					echo "Для запуска подключения необходимо передать протокол."
			fi
		echo "Логин:" $2>> testscriptfile.log  
		echo "Пароль:" $3>> testscriptfile.log 
		echo "Ключевое слово:" $4>> testscriptfile.log	


		response=$(curl -s -u $2:$3  $1  -I | head -n 1 | cut -d$' ' -f2)
		#echo $response
		case "$response" in							#echo $respffinnd | head -n 1 | cut -d$' ' -f2
		
			200)    respffinnd=$(curl -u $2:$3  $1 -s | grep "$4"  ) 
					#echo $respffinnd >> testscriptfile.log 

					# echo "$respffinnd" | grep "$4"  >> testscriptfile.log 

					if [ "$respffinnd" != ""  ]
							then
								echo "OK"
								echo "$respffinnd" | grep "$4"  >> testscriptfile.log 
								echo 'Выполнение хавершено' >> testscriptfile.log  

							else
								#echo "$respffinnd" | grep "$4"
								echo "Fail"
					
						fi 
					
					#echo "200 OK Pade saved." 
					 ;;
			301) echo "Fil 301 check proto" ;;
			304) echo "Fil 304";;
			401) echo "Cannot connect to $1 code 401, wrong login or password." ;;
			403) echo "Cannot connect to $1 code 403" ;;
			404) echo "Cannot connect to $1 code 404" ;;
			500) echo "Cannot connect to $1 code 500" ;;
			*) echo "fail";;
		esac

	else
		echo "Для запуска скрипта необходимо передать 4 непустых параметра."
fi

echo '<----->' >> testscriptfile.log  
echo "Done."





# response=$(curl -u $2:$3  $1  -I | head -n 1 | cut -d$' ' -f2)
# 	echo $response
# 	case "$response" in
# 		200) curl -u $2:$3  $1 -I >> testscriptfile.log && clear && echo "200 OK Pade saved." ;;
# 		301) echo "Fil 301 check proto" ;;
# 		304) echo "Fil 304";;
# 		401) echo "Cannot connect to $1 code 401, wrong login or password." ;;
# 		403) echo "Cannot connect to $1 code 403" ;;
# 		404) echo "Cannot connect to $1 code 404" ;;
# 		500) echo "Cannot connect to $1 code 500" ;;
# 	esac

################

# resp = "$( curl '+%u' $2:$3 $1 "+%T" 2>/dev/null )"
# echo Это строка:  "$resp"

#echo Это строка:  $resp
#####################

#1
#echo $f >> testscriptfile.log
#Чт. июня  5 09:26:38 MSK 2014: Started

# ftp=ftp:\/\/*
# http=http:\/\/*
# https=https:\/\/*

#2 задание
# if [ $# = 4 ]
# 	then 
# 	echo $f >> testscriptfile.log
# 	echo $1 && echo $1>> testscriptfile.log  
# 	echo $2 && echo $2>> testscriptfile.log  
# 	echo $3  && echo $3>> testscriptfile.log 
# 	echo $4 && echo $4>> testscriptfile.log
# 	echo done
# else
# 	echo "Для запуска скрипта необходимо передать 4 непустых параметра."
# fi

##черновик

# i=`curl -u $2:$3  $1  -I`  # | head -n 3 | cut -d$' ' -f2 #
# #echo "its $i"

# j=`$i | head -n 1 | cut -d$' ' -f2`

# echo "its $j"

# if [ $j = "200" ]
# 	then
# 		echo OKAY  
# 		curl -u $2:$3  $1 -I >> testscriptfile.log
# 	else
# 		echo $i  
# 		 # "CODE:  $j" && echo "FAILD CODE:"  $j >> testscriptfile.log
# fi
#clear;