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

build-release:
	@echo "Building for release..."
	@swift build -c release


# Test

test:
	@echo "Testing..."
	@swift test

run:
	@echo "Running..."
	@swift run SportsbookBFF

# Functions

define brew_install
	@if which $(1) >/dev/null; then \
  		echo "$(1) installed"; \
	else \
		echo "Installing $(1)..."; \
  		brew install $(1); \
	fi
endef
