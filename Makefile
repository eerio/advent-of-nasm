
build=build
src=src
inc=inc
srcs = $(wildcard $(src)/*.asm)
bins = $(patsubst $(src)/%.asm, $(build)/%, $(srcs))

all: $(bins)

$(bins): $(srcs)
	nasm -f elf64 $< -o $@
	ld $@ -o $@


clean:
	rm -f $(build)

.PHONY: all clean

