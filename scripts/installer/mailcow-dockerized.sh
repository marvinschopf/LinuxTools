cd ~
function greenMessage {
  echo -e "\\033[32;1m${*}\033[0m\n"
}

function magentaMessage {
  echo -e "\\033[35;1m${*}\033[0m\n"
}

function cyanMessage {
  echo -e "\\033[36;1m${*}\033[0m\n"
}

function redMessage {
  echo -e "\\033[31;1m${*}\033[0m\n"
}

function yellowMessage {
  echo -e "\\033[33;1m${*}\033[0m\n"
}

redMessage "############################################"
cyanMessage "Welcome to the Mailcow-Installer!        ##"
redMessage "############################################"
cyanMessage "Wizard: (C) 2017 MarvNet (blog.marvnet.de)#"
redMessage "############################################"
clear


redMessage "10%: ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
cyanMessage "Installing docker...."
clear
curl -sSL https://get.docker.com/ | sh
clear
redMessage "30%: #######~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
cyanMessage "Installing docker-compose..."
clear
curl -L https://github.com/docker/compose/releases/download/$(curl -Ls https://www.servercow.de/docker-compose/latest.php)/docker-compose-$(uname -s)-$(uname -m) > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
clear
redMessage "50%: ###############~~~~~~~~~~~~~~~~~~~~~~"
cyanMessage "Installing mailcow-dockerized from GitHub..."
clear
git clone https://github.com/mailcow/mailcow-dockerized && cd mailcow-dockerized
clear
redMessage "70%: ###########################~~~~~~~~~~"
cyanMessage "Generating configuration..."
clear
./generate_config.sh
clear
redMessage "99%: ##################################~~~"
cyanMessage "Loading mailcow and bringing it up..."
clear
docker-compose pull
docker-compose up -d
clear
redMessage   "100%: #####################################"
greenMessage "Done!"
greenMessage "###########################################"
clear
magentaMessage "Thank you for using this script :)"
magentaMessage "DONT FORGET: To leave a comment on blog.marvnet.de/2017/09/24/mailcow-mailserver-installieren/ !!!"
greenMessage "THANK YOU!!!!!"
clear
