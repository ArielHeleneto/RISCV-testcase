CSMITH		= csmith

.PHONY: default clean

include list.mk
include csrc.mk

default: $(SHA) $(CSRC)

%.c:
	$(CSMITH) > $@

%.o0.clang.run: %.c
	clang -O0 $< -o $@

%.o0.gcc.run: %.c
	gcc -O0 $< -o $@

%.o1.clang.run: %.c
	clang -O1 $< -o $@

%.o1.gcc.run: %.c
	gcc -O1 $< -o $@

%.o2.clang.run: %.c
	clang -O2 $< -o $@

%.o2.gcc.run: %.c
	gcc -O2 $< -o $@

%.o3.clang.run: %.c
	clang -O3 $< -o $@

%.o3.gcc.run: %.c
	gcc -O3 $< -o $@

%.os.clang.run: %.c
	clang -Os $< -o $@

%.os.gcc.run: %.c
	gcc -Os $< -o $@

%.sha: %.run
	./$< 2>&1 | sha256sum > $@
	

clean:
	-rm *.run *.c *.sha
