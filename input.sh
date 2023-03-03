#!/bin/bash

clear
# echo "[ Program ]"
# version="0.0.1v"
# echo -e "\tVersion ${version}"
# printf "\tVersion %s\n" "$version"

# get input
# echo -n "enter your name: "
# read name
# echo "[ your name is $name]"
# echo "[ your name is ${name}ing ]"

# user debug mode
# bash +x name.sh
# str="s"
# v=$(expr 5 + $str)

# expr
# echo $(expr 5 + 5)
echo "rs: ( $# > 1)"
echo "rs: $(( $# > 1))"

# handling named arguments
echo "number of arguments: $#"
deploy=false
dev=false
while (( $# > 1 ));
do
    case $1 in
        --deploy)
            deploy=$2;;
        --dev)
            dev=$2;;
        *) break;
    esac;
    shift 2
done
$deploy && echo "will deploy... deploy = $deploy"

