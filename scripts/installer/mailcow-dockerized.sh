cd ~
RED='\033[0;31m'
NC='\033[0m'
ORANGE='\033[0;33m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'

printf "${ORANGE}Welcome to the Mailcow-Dockerized Installer!${NC}\n"
printf "${ORANGE}============================================${NC}\n"
printf "${ORANGE}Wizard: (C) 2017 MarvNet${NC}\n"
printf "${ORANGE}Mailcow: See mailcow.email${NC}\n"
printf "${ORANGE}============================================${NC}\n"
printf "${ORANGE}Starting...${NC}\n"
printf "${RED}Waiting for confirmation...${NC}\n"
pause
printf "${GREEN}Confirmed!${NC}\n"
printf "${ORANGE}Installing docker...${YELLOW}\n"
curl -sSL https://get.docker.com/ | sh
printf "${ORANGE}Installing docker-compose...${YELLOW}\n"
curl -L https://github.com/docker/compose/releases/download/$(curl -Ls https://www.servercow.de/docker-compose/latest.php)/docker-compose-$(uname -s)-$(uname -m) > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
printf "${ORANGE}Downloading mailcow...${YELLOW}\n"
git clone https://github.com/mailcow/mailcow-dockerized && cd mailcow-dockerized
printf "${ORANGE}Generating mailcow configuration... NOTICE: User interaction required!${YELLOW}\n"
./generate_config.sh
printf "${ORANGE}Loading mailcow and bringing it up...${YELLOW}\n"
docker-compose pull
docker-compose up -d
printf "${GREEN}Successfully installed mailcow-dockerized! Have fun :)${NC}\n"