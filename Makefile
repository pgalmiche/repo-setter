.PHONY: docker-build docker-run docker-stop docker-run-disk docker-logs docker-remove-images create-doc run-firefox-dashboard docker-exec clean docker-clean-cache
include install/.env
help:
	@echo "make requires some arguments with the usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  docker-build   	Build the Docker images with docker compose (takes about 3min)"
	@echo "  docker-run     	Run the Docker containers"
	@echo "  docker-stop    	Stop the Docker containers and remove them"
	@echo "  docker-logs   Displays the logs of the containers"
	@echo "  docker-remove-images   Remove/Delete the created images"
	@echo "  create-doc     	Create or Refresh doc file"
	@echo "  run-firefox-doc    	Run the doc in firefox"
	@echo "  show-doc-chrome  Run the doc in google-chrome"
	@echo "  show-firefox-dashboard Run the julia dashboard in firefox"
	@echo "  clean 						Removes unwanted files"


# Docker related

docker-build:
	@cd install/ && \
	docker compose build --no-cache $(DOCKER_CONTAINERS) && \
	docker builder prune -f && \
	cd ..

docker-run:
	@cd install/ && \
	docker compose -f docker-compose.yml -f docker-compose.volumes.yml up -d $(DOCKER_CONTAINERS) && \
	echo "Old containers replaced"
docker-exec:
	@docker ps --format "table {{.Names}}\t{{.ID}}\t{{.Image}}" && \
	read -p "Enter the container name or ID: " container && \
	docker exec -it $$container /bin/bash
docker-run-disk:
	@cd install/ && \
	docker compose -f docker-compose.yml -f docker-compose.volumes_disk.yml up -d $(DOCKER_CONTAINERS) && \
	echo "Old containers replaced"

docker-stop:
	@cd install/ && \
	docker compose down --volumes --remove-orphans && \
	docker builder prune -f
docker-remove-images:
	@cd install/ && \
	docker compose down --rmi all --volumes --remove-orphans
docker-clean-cache:
	@docker builder prune -f && \
	echo "Docker cache removed for more space on your computer :)"

docker-logs:
	@cd install/ && \
	docker compose logs --follow;


show-containers:
	@echo "The following containers are available: $(DOCKER_CONTAINERS)"

		

# Doc related
create-doc:
	cd ./doc/ && \
	doxygen Doxyfile

run-firefox-doc: ./doc/html/index.html
	@firefox ./doc/html/index.html

show-doc-chrome: ./doc/html/index.html
	google-chrome ./doc/html/index.html

show-firefox-dashboard:
	@firefox localhost:$(LOCAL_DISPLAY_PORT)


clean:
	@rm -rf .mypy_cache
	@rm -f *.ini
	@echo "Cleaning is done."
