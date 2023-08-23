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
           git clone  https://github.com/ggerganov/llama.cpp.git
           #enter llama.cpp folder
           cd llama.cpp                                                                                                                                      
           #start building llama.cpp (if you get an error try replacing make with cmake and see if that works)
           make
           echo -e "Enter 1 for Download Griffin 3B"
           read website
           #downloading the 3B Griffin model
           if [ $website -eq "1" ] 
		then
                wget https://huggingface.co/TheBloke/Griffin-3B-GGML/blob/main/griffin-3b.ggmlv3.q4_0.bin

           fi
              else    
  echo "wrong input exiting"
fi
