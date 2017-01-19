all: sniff test

benchmark:
	perf stat -r 10 make test

sniff:
	./sniff.sh

test:
	./test.sh

.PHONY: test
