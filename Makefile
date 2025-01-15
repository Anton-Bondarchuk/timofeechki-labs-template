
check:
	@echo "it works"

local-build:
	@docker build -t node_test --target devrunner .

local-start:
	@docker run --rm -v .:/opt/work  node_test


local: local-build \
  	local-start
