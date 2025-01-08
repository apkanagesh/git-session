#!/bin/bash

# index start from 0,size is 3
FRUITS=("APPLE" "KIWI" "ORANGE")

echo "first fruit is: ${FRUITS[0]}"
echo "second fruit is: ${FRUITS[1]}"
echo "third  fruit is: ${FRUITS[2]}"

echo "first fruit is: ${FRUITS[@]}"

