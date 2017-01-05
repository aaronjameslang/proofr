all:
	./build/install-dev-dependencies.sh
	shellcheck **/**.sh
	checkbashisms **/**.sh || true
	roundup test/*-test.sh
