# This is an Makefile example of using go.makefile
include go.makefile

BUILD_ROOT ?= ./build


.PHONY: clean
clean:  ## Clean build bundles
	-rm -rf $(BUILD_ROOT)


.PHONY: build-all
build-all: build-darwin build-linux build-windows ## Build for all platforms

.PHONY: build-darwin
build-darwin: ## Build for MacOS
	-rm -rf $(BUILD_ROOT)/darwin
	GOOS=darwin GOARCH=amd64 CGO_ENABLED=0 \
		go build -o $(BUILD_ROOT)/darwin/$(APPROOT) \
		./hello.go

.PHONY: build-linux
build-linux: ## Build for Linux
	-rm -rf $(BUILD_ROOT)/linux
	GOOS=linux GOARCH=amd64 CGO_ENABLED=0 \
		go build -o $(BUILD_ROOT)/linux/$(APPROOT) \
		./hello.go

.PHONY: build-windows
build-windows: ## Build for Windows
	-rm -rf $(BUILD_ROOT)/windows
	GOOS=windows GOARCH=amd64 CGO_ENABLED=0 \
		go build -o $(BUILD_ROOT)/windows/$(APPROOT).exe \
		./hello.go
