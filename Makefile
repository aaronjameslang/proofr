all: sniff test

sniff:
	./sniff.sh

test:
	./test.sh

.PHONY: test
