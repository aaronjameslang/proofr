all: sniff test-libs test test-shells

benchmark:
	perf stat -r 10 make test

sniff:
	./sniff.sh

test:
	./test.sh

test-libs:
	#cd test && roundup
	cd test && sh ./*

test-shells:
	./test-shells.sh

.PHONY: test
