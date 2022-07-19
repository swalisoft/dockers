#!/bin/bash
# copy this from android studio official webpage

studio_version='android-studio-2021.1.1.22-linux.tar.gz';

echo -e "\n+ apt -y update && apt upgrade\n";
apt -y update && apt upgrade;

echo -e "\n+ apt -y -q install bash tmux curl vim xauth unzip tar wget\n";
apt -y -q install bash tmux curl vim xauth unzip tar wget sudo;

echo -e "\n+ curl -fsSL https://deb.nodesource.com/setup_14.x | bash -\n";
curl -fsSL https://deb.nodesource.com/setup_14.x | bash -;

echo -e "\n+ apt -y -q update && apt -y install nodejs openjdk-11-jdk\n";
apt -y -q update && apt -y install nodejs openjdk-11-jdk;

#npm install --global yarn

user=$1;
if [ ! $user ]
then
	user='admin'
fi;

echo -e "\nuseradd -s /bin/bash -m -G sudo -p PASSWORD admin\n";
useradd -s /bin/bash -m -G sudo -p $(echo 34353435 | openssl passwd -1 -stdin) $user;

cd /home/$user;

echo """
wget https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2021.1.1.22/$studio_version
""";
eval "wget https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2021.1.1.22/$studio_version -q";

echo -e "\ntar -xf $studio_version\n";
tar -xvf $studio_version; 
eval "rm $studio_version";  

AndroidVars='''
export ANDROID_HOME=$HOME/Android/Sdk\n
export PATH=$PATH:$ANDROID_HOME/emulator\n
export PATH=$PATH:$ANDROID_HOME/tools\n
export PATH=$PATH:$ANDROID_HOME/tools/bin\n
export PATH=$PATH:$ANDROID_HOME/platform-tools\n
\n
export JAVA_HOME="/usr/lib/jvm/java-11-openjdk"\n
export PATH=$JAVA_HOME/bin:$PATH
''';

echo -e $AndroidVars >> /home/$user/.bashrc;

# To open android gui ./android-studio/bin/studio.sh
# /usr/lib/jvm/java-11-openjdk-amd64/

