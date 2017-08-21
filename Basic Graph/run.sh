#!/bin/bash

# Provide a way to select between matrix or adjacency list implementation

red='\e[0;31m'
green='\e[0;32m'
l_green='\e[1;32m'
cyan='\e[1;36m'
nocolor='\e[0m'

exe=graph
make_arg=''

echo '          It seems that we have two kinds of Graph implementations available'
echo 'Select one of the implementations:'
echo '1. Adjacency list(Default)'
echo '2. Adjacency matrix'

read option
if [ $option -eq 1 ]; then
    make_arg=''
elif [ $option -eq 2 ]; then
    make_arg='-DMATRIX_IMPL'
else
    echo -e "${red} Wrong option!${nocolor}"
    exit
fi

echo -e "${green}Building Project: Basic Graph ..."
make clean
make DEFINES=$make_arg
wait
echo -e "${l_green}[Build successful]"
echo -e "Running the program..."
printf "\n"
echo -e "${cyan}---------------- Basic Graph ----------------${nocolor}"

./$exe

wait

echo -e "\n${cyan}--------------- End of execution ---------------"
printf "\nCleaning up directory...${nocolor}\n"

make clean
