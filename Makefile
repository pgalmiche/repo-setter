.PHONY: build_docker docker_run docker_stop docker docker_logs docker_images_removal create_doc firefox_dashboard docker_exec_in_python clean docker_clean_cache
include install/.env
help:
	@echo "make requires some arguments with the usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  build_docker   	Build the Docker images with docker compose (takes about 3min)"
	@echo "  docker_run     	Run the Docker containers"
	@echo "  docker_stop    	Stop the Docker containers and remove them"
	@echo "  docker_compose_logs   Displays the logs of the containers"
	@echo "  docker_images_removal   Remove/Delete the created images"
	@echo "  create_doc     	Create or Refresh doc file"
	@echo "  firefox_doc    	Run the doc in firefox"
	@echo "  show_doc_chrome  Run the doc in google-chrome"
	@echo "  firefox_run_dashboard Run the julia dashboard in firefox"
	@echo "  clean 						Removes unwanted files"


show_containers:
	@echo "The following containers are available: $(DOCKER_CONTAINERS)"

build_docker:
	@cd install/ && \
	docker compose build --no-cache $(DOCKER_CONTAINERS) && \
	docker builder prune -f && \
	cd ..

docker_run:
	@cd install/ && \
	docker compose up -d $(DOCKER_CONTAINERS) && \
	echo "Old containers replaced"

docker_stop:
	@cd install/ && \
	docker compose down --volumes --remove-orphans && \
	docker builder prune -f
	
docker_clean_cache:
	@docker builder prune -f && \
	echo "Docker cache removed for more space on your computer :)"

docker_logs:
	@cd install/ && \
	docker compose logs --follow; \

docker_images_removal:
	@cd install/ && \
	docker compose down --rmi all --volumes --remove-orphans
		
create_doc:
	cd ./doc/ && \
	doxygen Doxyfile

firefox_doc: ./doc/html/index.html
	@firefox ./doc/html/index.html

show_doc_chrome: ./doc/html/index.html
	google-chrome ./doc/html/index.html

firefox_dashboard:
	@firefox localhost:$(LOCAL_DISPLAY_PORT)

docker_exec:
	@docker exec -it $(container) /bin/bash

clean:
	@rm -rf .mypy_cache
	@rm -f *.ini
	@echo "Cleaning is done."
