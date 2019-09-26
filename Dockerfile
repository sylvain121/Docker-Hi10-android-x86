FROM    ubuntu:rolling
MAINTAINER      sylvain121

ENV     DEBIAN_FRONTEND=noninteractive
ENV 	BRANCH=oreo-x86
ENV     JACK_SERVER_VM_ARGUMENTS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4g"
ENV 	USER=root
RUN     apt-get update
RUN     apt-get dist-upgrade -y
RUN     apt-get install g++ build-essential git-core openjdk-8-jdk curl python bash -y
RUN     apt-get install unzip autoconf m4 bison zip gettext -y
RUN     dpkg --add-architecture i386
RUN     apt-get update
RUN     apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 libncurses5  libssl-dev -y
RUN 	curl https://storage.googleapis.com/git-repo-downloads/repo > /bin/repo
RUN 	chmod a+x /bin/repo
ADD	syncAndBuild.sh /sbin/
RUN 	mkdir /root/android-x86
RUN     chmod a+x /sbin/syncAndBuild.sh
RUN     apt-get install python-pip libyaml-dev libxml2-utils -y
RUN     pip install prettytable Mako pyaml dateutils --upgrade
RUN 	apt-get install bc kmod -y
RUN 	apt-get install genisoimage -y 
RUN 	apt-get install syslinux-utils -y
ADD     init /bin/
RUN     chmod a+x /bin/init
VOLUME	/root/android-x86
WORKDIR /root/android-x86
CMD	bash syncAndBuild.sh
