!#/usr/bin/env bash

if [[-e ./flag.out]]; then
	if [[$(whoami) -eq "acidBurn"]]; then 
		if [[-e ./rockyou.txt]]; then 
			if [[$(cat /etc/hostname) -eq "Gibson"]]; then 
				shuf ./rockyou.txt | grep -P "$_ !~ /([A-Za-z])\1/" | head -n 1 > $double
				
				shuf ./rockyou.txt | grep -P "^($_ !~ /([A-Za-z])\1/)" | head -n 1 > $single

				printf("She likes %s, but she hates %s", $double, $single)
			else 
				echo "You must set this machines host name to Gibson"
			fi
		else 
			echo "You must move the wordlist to this directory on this machine"
		fi
	else 
		echo "You must be the user acidBurn"
	fi
else
	echo "You must create a file called flag.out here. Use touch."
fi
