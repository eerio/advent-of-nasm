#!/bin/bash

files=/usr/include/asm-generic

for filename in $(find $files -name '*.h'); do
	name=${filename##*/}
	cpp -dM $filename | sed 's/#/%/' > inc/$name
done

