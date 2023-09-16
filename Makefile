PROJECTNAME := $(shell basename "$(PWD)")
OS := $(shell uname -s | awk '{print tolower($$0)}')
GOARCH := amd64

## run: execute main application
.PHONY: run
run:
	export APPENV=local; go run -race cmd/main.go

## wiregen: generate dependency injection wire_gen.go from wire.go(+build wireinject)
.PHONY: wiregen
wiregen:
	wire ./...

## up: start the service using docker compose
.PHONY: up
up:
	docker-compose -f deploy/docker-compose.yml up -d

## up_rebuild: rebuild image and force create container the elasticsearch sample service using docker compose
.PHONY: up_rebuild
up_rebuild:
	docker-compose -f deploy/docker-compose.yml up -d --build --no-deps --force-recreate

## down: down the elasticsearch sample service
.PHONY: down
down:
	docker-compose -f deploy/docker-compose.yml down

## down_clean: docker compose down with docker-compose-elasticsearch.yml file.
.PHONY: down_clean
down_clean:
	docker compose -f deploy/docker-compose.yml down  --volumes

## tidy: special go mod tidy without golang database checksum(GOSUMDB)
.PHONY: tidy
tidy:
	export GOSUMDB=off; go mod tidy

## test: run go test
test:
	go clean -testcache & go test -v -race ./...

## set_private_repo_global: set a "gitdev.devops.napat.com" to be a private repo in go global environment 
set_private_repo_global:
	go env -w GOPRIVATE="gitdev.devops.napat.com/*"

## update_standard_lib: update standard library (mylab-standard-library) with GOPRIVATE option
update_standard_lib:
	GOPRIVATE=gitdev.devops.napat.com/mylab/mylab-standard-library go get gitdev.devops.napat.com/mylab/mylab-standard-library

## help: helper
.PHONY: help
all: help
help: Makefile
	@echo
	@echo " Project: ["$(PROJECTNAME)"]"
	@echo " Please choose a command"
	@echo
	@sed -n 's/^##//p' $< | column -t -s ':' |  sed -e 's/^/ /'
	@echo

## gosec: run for scan code vulnerability by securego/gosec
.PHONY: gosec 
gosec: 
	gosec ./... 

## govulncheck: run for scan vulnerability package from Go vulnerability database
.PHONY: govulncheck
govulncheck: 
	govulncheck ./... 

## security: run make gosec and make govulncheck
security: gosec govulncheck

## gogen: run all go genrate(mockgen, etc)
gogen:
	go generate ./...
