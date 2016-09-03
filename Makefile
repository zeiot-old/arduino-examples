# Copyright (C) 2016 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

SHELL = /bin/bash

NO_COLOR=\033[0m
OK_COLOR=\033[32;01m
ERROR_COLOR=\033[31;01m
WARN_COLOR=\033[33;01m

MAKE_COLOR=\033[33;01m%-15s\033[0m

.DEFAULT_GOAL := help

.PHONY: help
help:
	@echo -e "$(OK_COLOR)==== $(APP) [$(VERSION)] ====$(NO_COLOR)"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "$(MAKE_COLOR) : %s\n", $$1, $$2}'

.PHONY: clean
clean: ## clean installation
	platformio run -d blink --target clean

.PHONY: init
init: ## Initialize Arduino environment
	virtualenv --python=/usr/bin/python2 venv && \
		. venv/bin/activate && pip2 install platformio

.PHONY: list
list: ## List serial ports
	platformio serialports list

.PHONY: monitor
monitor: ## serial port monitor ('ctrl+]' to quit)
	platformio serialports monitor

.PHONY: run-all
build-all: ## Build projects
	platformio run -d blink
	platformio run -d button-led
	platformio run -d dht
	platformio run -d traffic-light
	platformio run -d wifi

.PHONY: upload-all
upload-all: ## Build and upload projects
	platformio run -d blink --target upload
	platformio run -d button-led --target upload
	platformio run -d dht --target upload
	platformio run -d traffic-light --target upload
	platformio run -d wifi --target upload

.PHONY: run
build: ## Build projects (arg: project=xx)
	platformio run -d $(project)

.PHONY: upload
upload: ## Build and upload projects (arg: project=xx)
	platformio run -d $(project) --target upload
