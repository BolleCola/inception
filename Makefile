# COLORS
GREEN		= \033[1;32m
RED 		= \033[1;31m
ORANGE		= \033[1;33m
CYAN		= \033[1;36m
RESET		= \033[0m

# FOLDER
ENV_FILE    = ./srcs/.env
SRCS_DIR	= ./srcs/
DOCKER_DIR	= ${SRCS_DIR}docker-compose.yml
NAME		= inception

# COMMANDS
DOCKER		=  docker compose -f ${DOCKER_DIR} --env-file ${ENV_FILE} -p ${NAME}

all: up

up:
	@echo "${GREEN}Building containers...${RESET}"
	@${DOCKER} up -d

build:
	@echo "${GREEN}Building containers...${RESET}"
	@mkdir -p /home/tpaquier/data/data
	@mkdir -p /home/tpaquier/data/wordpress
	@${DOCKER} up -d --build

down:
	@echo "${GREEN}Stopping containers...${RESET}"
	@${DOCKER} down

stop:
	@echo "${GREEN}Stopping containers...${RESET}"
	@${DOCKER} stop

start:
	@echo "${GREEN}Starting containers...${RESET}"
	@${DOCKER} start

restart:
	@echo "${GREEN}Restarting containers...${RESET}"
	@${DOCKER} restart

delete:
	@echo "${GREEN}Deleting containers...${RESET}"
	@${DOCKER} down --volumes --remove-orphans
	@rm -rf /home/tpaquier/data/data
	@rm -rf /home/tpaquier/data/wordpress
	

rebuild: delete
	@echo "${GREEN}Rebuilding containers...${RESET}"
	@${DOCKER} up -d --build --force-recreate