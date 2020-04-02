#!/bin/bash

files=/usr/include/asm-generic

for filename in $(find $files -name '*.h'); do
	cpp -dM $filename | sed 's/#/%/' > inc/${filename##*/}
done

