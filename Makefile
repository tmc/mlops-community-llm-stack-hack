# This makefile provides helper targets for building and running the project.
# Run `make help` to print out all the available targets.

.PHONY: run-services
run-services: ## Run services
	@echo "Running services"
	@echo "To clean up and shut down all resources associated with this project, run 'make clean'"
	@cd ./dev-harness && make deps
	@cd ./dev-harness && tilt up

.PHONY: generate
generate: ## Generate code.
	@echo "Generating code..."

.PHONY: port-doctor
port-doctor: ## Check if the required ports are available.
	@echo "Checking if the required ports are available..."
	@./scripts/port-doctor.sh \
		3000 4000 8000 8080 

.PHONY: clean
clean: ## Cleans up and shuts down resources assocaited with this project.
	@cd ./dev-harness && tilt down

.PHONY: help
help: ## Show help for each of the Makefile recipes.
	@# This shell prints out the help for each target in this Makefile.
	@grep -E '^[a-zA-Z0-9 -]+:.*##'  Makefile | sort | while read -r l; do printf "\033[1;32m$$(echo $$l | cut -f 1 -d':')\033[00m:$$(echo $$l | cut -f 2- -d'#')\n"; done

.DEFAULT_GOAL := help
