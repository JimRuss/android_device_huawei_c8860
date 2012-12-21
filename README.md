android_device_huawei_c8860
===========================

ICS device tree for Huawei Mercury.

I would like to thank fredvj and playfulgod for there repo's.Reading through there work has helped me to understand androids a little better.Now if I could just learn how to use github a little better!

The files in my proprietary-files.txt were pulled from gingerbread.
All other files added were from playfulgods rom.
These will have to be added to device_c8860.mk,so the build will know where to pull from and where to place it.
If you pull autorun.iso from gingerbread you will have to edit c8860-vendor-blobs.mk to put it in system/cdrom/autorun.iso. So it will be"vendor/huawei/c8860/proprietary/../data/cdrom/autorun.iso:system/cdrom/autorun.iso"

The more we can get people involved in compiling for our phones the better chance we have of getting the right combination that works best!One of you may be the next Dev for androids!I'm a middle aged newbie at this who took c+ and fortran in high school many years ago and likes to learn.There's no reason why others can't learn to compile if someone will point them in the right direction.So here's the basics on what little I know.

I have been using a home built pc for compiling and it takes about 24 min. for each build after a change.I'm using an i5 3570k processor overclocked to 4.3GHz with 16GB of ram.I've also compiled ccache to help speed things up.The latest version is 3.1.8!It comes with very good instructions.Just remember this can eat up alot of time,so now you can see why more people working on this could help get things rolling alot faster. 

    You will need to download jdk to downloads folder.

    Installing Sun JDK 6 on Ubuntu 12.04:

    Download the sun jdk 6 bin from here.
http://www.oracle.com/technetwork/java/javase/downloads/index.html

   cd ~/Downloads

(Make the bin file executeable:change jdk version to the one you downloaded)

   chmod +x jdk-6u37-linux-x64.bin

(Extract the bin file:)

   ./jdk-6u37-linux-x64.bin

(Move extracted folder to this location:)

   sudo mv jdk1.6.0_37 /usr/lib/jvm/

(Install new java source in system:)

   sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk1.6.0_37/bin/javac 1

   sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk1.6.0_37/bin/java 1

   sudo update-alternatives --install /usr/bin/javaws javaws /usr/lib/jvm/jdk1.6.0_37/bin/javaws 1

(Choose default java:)

   sudo update-alternatives --config javac

   sudo update-alternatives --config java

   sudo update-alternatives --config javaws

(java version test:)
   java -version

(Verify the symlinks all point to the new java location:)
   ls -la /etc/alternatives/java*

(Enable Java plugin for Mozilla Firefox (even for Chrome))
"for 64-Bit jdk"

   sudo ln -s /usr/lib/jvm/jdk1.6.0_37/jre/lib/amd64/libnpjp2.so /usr/lib/mozilla/plugins

"for 32-Bit jdk"

   sudo ln -s /usr/lib/jvm/jdk1.6.0_37/jre/lib/i386/libnpjp2.so /usr/lib/mozilla/plugins

Tools used for compiling "Comes from android source web page"

$ sudo apt-get install git-core gnupg flex bison gperf build-essential zip   curl libc6-dev libncurses5-dev x11proto-core-dev libx11-dev:i386
libreadline6-dev:i386 libgl1-mesa-glx:i386 libgl1-mesa-dev g++-multilib  mingw32 tofrodos python-markdown libxml2-utils xsltproc zlib1g-dev:i386
  

$ sudo ln -s /usr/lib/i386-linux-gnu/mesa/libGL.so.1 /usr/lib/i386-linux-gnu/libGL.so
  
I hope someone can learn from this and always remember to give credit to those people that have put alot of time and effort into making are androids better.
Goodluck with you builds!
