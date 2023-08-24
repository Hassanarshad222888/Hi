cd
echo "Welcome please choose what you want to do:"
echo "1-install a model"
echo "2-uninstall a model"
echo "h-help"
echo "enter anything else to exit"
read choice

if [[ $choice -eq "1" ]]
	 then
        echo "please select a model to install:"
        echo "1-Alpaca-7B"
        read choice
        if [[ $choice -eq "1" ]] 
	  then
           cd
           #cloning the github repository of alpaca.cpp                                                                                                       
           git clone  https://github.com/antimatter15/alpaca.cpp
           #enter alpaca.cpp folder
           cd alpaca.cpp                                                                                                                                      
           #start building alpaca.cpp (if you get an error try replqcing make with cmake and see if that works)
           make
           echo -e  "\e[32m select whether to use hugginface or mega(recommended) to download the model?"
           echo -e "enter 1 for Download"
           read website
           #downloading the 7B alpaca model
           if [ $website -eq "1" ] 
		then
                wget https://huggingface.co/Sosaka/Alpaca-native-4bit-ggml/resolve/main/ggml-alpaca-7b-q4.bin
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
