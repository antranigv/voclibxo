.POSIX:

export CFLAGS="-lxo"

all:
	@if [ ! -d build ]; then \
		mkdir build; \
	fi
	@cd build; voc -rs ../src/xo.Mod ../test/libxo_test.Mod -m
