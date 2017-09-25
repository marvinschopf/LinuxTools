cd ~
clear

printf "############################################"
printf "Welcome to the Mailcow-Installer!        ##"
printf "############################################"
printf "Wizard: (C) 2017 MarvNet (blog.marvnet.de)#"
printf "############################################"
clear


printf "10%: ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
printf "Installing docker...."
clear
curl -sSL https://get.docker.com/ | sh
clear
printf "30%: #######~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
printf "Installing docker-compose..."
clear
curl -L https://github.com/docker/compose/releases/download/$(curl -Ls https://www.servercow.de/docker-compose/latest.php)/docker-compose-$(uname -s)-$(uname -m) > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
clear
printf "50%: ###############~~~~~~~~~~~~~~~~~~~~~~"
printf "Installing mailcow-dockerized from GitHub..."
clear
git clone https://github.com/mailcow/mailcow-dockerized && cd mailcow-dockerized
clear
printf "70%: ###########################~~~~~~~~~~"
printf "Generating configuration..."
clear
./generate_config.sh
clear
printf "99%: ##################################~~~"
printf "Loading mailcow and bringing it up..."
clear
docker-compose pull
docker-compose up -d
clear
printf "100%: #####################################"
printf "Done!"
printf "###########################################"
clear
printf "Thank you for using this script :)"
printf "DONT FORGET: To leave a comment on blog.marvnet.de/2017/09/24/mailcow-mailserver-installieren/ !!!"
printf "THANK YOU!!!!!"
clear
