#!/bin/bash
wget https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip
mkdir android-sdk
unzip -qq sdk-tools-linux-3859397.zip -d android-sdk
export ANDROID_HOME=`pwd`/android-sdk
export PATH=`pwd`/android-sdk/tools/bin:$PATH
mkdir -p /home/travis/.android # silence sdkmanager warning
echo 'count=0' > /home/travis/.android/repositories.cfg # silence sdkmanager warning
        # suppressing output of sdkmanager to keep log under 4MB (travis limit)
yes | sdkmanager "tools" &>/dev/null
yes | sdkmanager "platform-tools" &>/dev/null
yes | sdkmanager "platforms;android-28" &>/dev/null
yes | sdkmanager --update &>/dev/null
yes | sdkmanager --licenses &>/dev/null
wget http://services.gradle.org/distributions/gradle-5.3.1-bin.zip
unzip -qq gradle-5.3.1-bin.zip
export GRADLE_HOME=$PWD/gradle-5.3.1
export PATH=${GRADLE_HOME}/bin:$PATH
gradle -v
