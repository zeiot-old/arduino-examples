# Copyright (C) 2016  Nicolas Lamirault <nicolas.lamirault@gmail.com>

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

APP = "arduino-examples"
VERSION = "0.1.0"

SHELL = /bin/bash

APPS = $(HOME)/Apps

ARDUINO_VERSION = 1.6.7
ARDUINO_DIR = $(APPS/arduino-$(ARDUINO_VERSION)

NO_COLOR=\033[0m
OK_COLOR=\033[32;01m
ERROR_COLOR=\033[31;01m
WARN_COLOR=\033[33;01m

MAKE_COLOR=\033[33;01m%-20s\033[0m

.DEFAULT_GOAL := help

.PHONY: help
help:
	@echo -e "$(OK_COLOR)==== $(APP) [$(VERSION)] ====$(NO_COLOR)"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "$(MAKE_COLOR) : %s\n", $$1, $$2}'

.PHONY: clean
clean: ## clean repository
	@echo -e "$(OK_COLOR)[$(APP)] Clean $(NO_COLOR)"
	@rm -f arduino-$(ARDUINO_VERSION)-linux64.*

.PHONY: init
init: ## Install dependencies
	@echo -e "$(OK_COLOR)[$(APP)] Install dependencies $(NO_COLOR)"
	@wget https://downloads.arduino.cc/arduino-$(ARDUINO_VERSION)-linux64.tar.xz && \
		unxz arduino-$(ARDUINO_VERSION)-linux64.tar.xz && \
		tar xf arduino-$(ARDUINO_VERSION)-linux64.tar -C $(APPS)
