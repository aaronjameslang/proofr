test:
	./build/install-dev-dependencies.sh
	roundup test/*-test.sh

.PHONY: test
