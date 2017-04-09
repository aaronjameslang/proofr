all: build sniff test-libs test test-shells

build: bin/proofr

bin/proofr: $(wildcard lib/*)
	mkdir -p bin
	echo '#! /bin/sh' | cat - lib/setup.sh lib/main.sh > bin/proofr
	chmod u+x bin/proofr

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
