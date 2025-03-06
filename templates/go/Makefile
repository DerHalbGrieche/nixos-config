
GOCMD != command -v go
GOBUILD = $(GOCMD) build
GOCLEAN = $(GOCMD) clean
GOTEST = $(GOCMD) test
GORUN = $(GOCMD) run
BINARY_NAME = build

.ONESHELL:
.RECIPEPREFIX = >
MAKEFLAGS += --silent
MAKEFLAGS += --no-print-directory
.PHONY: build clean test run
.DEFAULT_GOAL := build

#HELP: build the binary
build:
> $(GOBUILD) -o $(BINARY_NAME) -v

#HELP: clean the binary
clean:
> $(GOCLEAN)
> rm -f $(BINARY_NAME)

#HELP: run the tests
test: build
> $(GOTEST) -v ./...

#HELP: run the application
run:
> $(GORUN) main.go

#HELP: prints this screen
help:
> @printf "Available targets\n\n"
> @awk '/^[a-zA-Z\-_0-9]+:/ {
>   helpMessage = match(lastLine, /^#HELP: (.*)/);
>   if (helpMessage) {
>     helpCommand = substr($$1, 0, index($$1, ":")-1);
>     helpMessage = substr(lastLine, RSTART + 6, RLENGTH);
>     gsub(/\\n/, "\n", helpMessage);
>     printf "\033[36m%-30s\033[0m %s\n", helpCommand, helpMessage;
>   }
> }
> { lastLine = $$0 }' $(MAKEFILE_LIST)
