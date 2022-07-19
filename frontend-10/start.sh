#!/bin/sh

ssh="$HOME/.ssh";
baseRute="$HOME/projects";
project="alcaldia";

read -p "Proyect Name: ($project) " project

if [ ! $project ]
then
	project='alcaldia' 
fi;

echo $project $1

eval "docker run -it --rm -p 3001:3001 -v $ssh:/home/node/.ssh -v $baseRute/$project:/home/node/app node_10 $1";
