# Variables

OS_NAME := $(shell uname -s | tr A-Z a-z)
DOCKER_SWIFT_VERSION := 5.5

# Lint
lint:
	$(call brew_install,swiftlint) && swiftlint --strict


# Clean
clean:
	@rm -rf .build
	@rm -rf .swiftpm
	@rm -f default.profraw


# Build

build:
	@echo "Building..."
	@swift build

build-linux:
	@echo "Building for Linux..."
	@if [ "$(OS_NAME)" == "darwin" ]; then \
		docker run --rm --privileged --interactive --tty -v "$$(pwd):/src" -w "/src" swift:$(DOCKER_SWIFT_VERSION)-focal /bin/bash -c "swift build --build-path ./.build/linux"; \
	else \
		make build; \
	fi

build-release:
	@echo "Building for release..."
	@swift build -c release


# Test

test:
	@echo "Testing..."
	@swift test --parallel

test-linux:
	@echo "Testing for Linux..."
	@if [ "$(OS_NAME)" == "darwin" ]; then \
		docker run --rm --privileged --interactive --tty -v "$$(pwd):/src" -w "/src" swift:$(DOCKER_SWIFT_VERSION)-focal /bin/bash -c "swift test  --parallel --build-path ./.build/linux"; \
	else \
		make test; \
	fi

run:
	@echo "Running..."
	@swift run SportsbookBFF serve --env production --hostname 0.0.0.0 --port 8080

# Functions

define brew_install
	@if which $(1) >/dev/null; then \
  		echo "$(1) installed"; \
	else \
		echo "Installing $(1)..."; \
  		brew install $(1); \
	fi
endef
