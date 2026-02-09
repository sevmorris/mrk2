SHELL := /bin/bash

# Directories
REPO_ROOT := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
SCRIPTS   := $(REPO_ROOT)/scripts

.PHONY: all install fix-exec status update doctor post-install

all: install
bootstrap: install

fix-exec:
	@echo "Making scripts executables..."
	@find $(SCRIPTS) -type f -maxdepth 1 -not -name "*.md" -exec chmod +x {} + 2>/dev/null || true

install: fix-exec
	@"$(SCRIPTS)/install"

post-install: fix-exec
	@"$(SCRIPTS)/post-install"

status:
	@"$(SCRIPTS)/status"

update:
	@brew update
	@brew upgrade

doctor:
	@brew doctor

