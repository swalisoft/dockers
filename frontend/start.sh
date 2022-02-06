#!/bin/sh

ssh="$HOME/.ssh";
baseRute="$HOME/projects";
project="alcaldia";

read -p "Proyect Name: ($project) " project

if [ ! $project ]
then
	project='alcaldia' 
fi;

echo $project $1 $2 $3 "$4"

eval "docker run -it --rm -p 3001:3001 -v $ssh:/home/admin/.ssh -v $baseRute/$project:/home/admin/app alcaldia $1 $2 $3 $4";
