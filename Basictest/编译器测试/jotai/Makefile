tasks := $(patsubst %.c, %.task, $(wildcard *.c))

default: run

run: $(tasks)

%.task: %.c
	@lua singletest.lua $<
	@touch $@

clean:
	- for file in *.task; do rm $$file; done
	- for file in *.fail; do rm $$file; done
