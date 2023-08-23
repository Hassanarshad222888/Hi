cd
        echo "1- Install Griffin 3B"
        read choice
        if [[ $choice -eq "1" ]] 
	  then
           cd
           termux-setup-storage
           # update packages
           pkg update && pkg upgrade -y                                                                                 
           # install necessary packages
           pkg install clang wget git megatools cmake -y
           #cloning the github repository of alpaca.cpp                                                                                                       
           git clone  https://github.com/antimatter15/alpaca.cpp
           #enter alpaca.cpp folder
           cd alpaca.cpp                                                                                                                                      
           #start building alpaca.cpp (if you get an error try replacing make with cmake and see if that works)
           make
           echo -e "enter 1 for Download"
           read website
           #downloading the 3B Griffin model
           if [ $website -eq "1" ] 
		then
                wget https://huggingface.co/TheBloke/Griffin-3B-GGML/tree/main

           fi
           # making a shortcut script to launch alpaca easily with the word chat
           cd /$PREFIX/bin
           echo 'clear' > chat
           echo 'cd' >> chat
           echo 'cd alpaca.cpp' >> chat
           echo './chat' >> chat
           chmod +x chat
    else    
  echo "wrong input exiting"
fi
