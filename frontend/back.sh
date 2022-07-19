#!/bin/sh

ssh="$HOME/.ssh";
baseRute="$HOME/projects";
project="atm_bk";

read -p "Proyect Name: ($project) " project

if [ ! $project ]
then
	project='atm_bk' 
fi;

echo $project $1

eval "docker run -it --rm -p 9000:9000 -v $ssh:/home/node/.ssh -v $baseRute/$project:/home/node/app alcaldia_fr $1";
