ssh="$HOME/.ssh";
baseRute="$HOME/projects";
project=$1;

if [ ! $project ]
then
	project='mobile'
fi;

echo $project

docker run -it --net=host -e DISPLAY \
	--privileged \
	-v /tmp/.X11-unix \
	-v $ssh:/home/node/.ssh \
	-v $baseRute/$project:/home/admin/app \
	rnative bash;
