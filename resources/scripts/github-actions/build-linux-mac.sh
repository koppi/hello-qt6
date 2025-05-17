#!/bin/bash

os="$1"

# Determine OS.
if [[ "$os" == *"ubuntu"* ]]; then
  echo "We are building for GNU/Linux on Ubuntu."
  is_linux=true
else
  echo "We are building for macOS."
  is_linux=false
fi

echo "OS: $os"

# Prepare environment.
if [ $is_linux = true ]; then
  sudo DEBIAN_FRONTEND=noninteractive apt -y install -qq devscripts equivs lintian
  mk-build-deps -i -s sudo

  debuild --preserve-env --preserve-envvar PATH -i -us -uc -b

  sudo dpkg -i ../hello-qt6*.deb
  sudo apt -f install

fi

#  sudo add-apt-repository ppa:beineri/opt-qt-5.15.2-bionic -y
#  sudo apt update -qq
#  sudo apt full-upgrade -y

#  sudo DEBIAN_FRONTEND=noninteractive apt -y install qt515tools qt515base qt515webengine qt515svg qt515multimedia 
#  sudo DEBIAN_FRONTEND=noninteractive apt -y install openssl libssl-dev libgl1-mesa-dev gstreamer1.0-alsa gstreamer1.0-plugins-good gstreamer1.0-plugins-base gstreamer1.0-plugins-bad gstreamer1.0-qt5 gstreamer1.0-pulseaudio
  
#  source /opt/qt515/bin/qt515-env.sh
#else
#  pip3 install aqtinstall
  
#  QTPATH="$(pwd)/Qt"
#  QTVERSION="5.15.2"
#  QTBIN="$QTPATH/$QTVERSION/clang_64/bin"

#  echo "Qt bin directory is: $QTBIN"
#  echo "Qt will be installed to: $QTPATH"

#  aqt install-qt -O "$QTPATH" "mac" "desktop" "$QTVERSION" "clang_64"

#  export QT_PLUGIN_PATH="$QTPATH/$QTVERSION/clang_64/plugins"
#  export PATH="$QTBIN:$PATH"
#fi

#qmake --version

# Build application and package it.
git_tag=$(git describe --tags `git rev-list --tags --max-count=1`)
git_revision=$(git rev-parse --short HEAD)

#mkdir hello-qt6-build && cd hello-qt6-build
#qmake6 ..
#make -j$(`nproc`)
#make install
#cd "src/hello-qt6"
  
#if [ $is_linux = true ]; then
  # Obtain linuxdeployqt.
#  wget -c https://github.com/probonopd/linuxdeployqt/releases/download/continuous/linuxdeployqt-continuous-x86_64.AppImage
#  chmod a+x linuxdeployqt-continuous-x86_64.AppImage 

  # Copy Gstreamer libs.
#  install -v -Dm755 "/usr/lib/x86_64-linux-gnu/gstreamer1.0/gstreamer-1.0/gst-plugin-scanner" "AppDir/usr/lib/gstreamer1.0/gstreamer-1.0/gst-plugin-scanner"
#  gst_executables="-executable=AppDir/usr/lib/gstreamer1.0/gstreamer-1.0/gst-plugin-scanner"

#  for plugin in $(ls /usr/lib/x86_64-linux-gnu/gstreamer-1.0/libgst*.so); do
#    basen=$(basename "$plugin")
#    install -v -Dm755 "$plugin" "AppDir/usr/lib/gstreamer-1.0/$basen"
#    gst_executables="${gst_executables} -executable=AppDir/usr/lib/gstreamer-1.0/$basen"
#  done

#  echo "Gstream command line for AppImage is: $gst_executables"

  # Create AppImage.
#  unset QTDIR; unset QT_PLUGIN_PATH ; unset LD_LIBRARY_PATH
#  ./linuxdeployqt-continuous-x86_64.AppImage "/home/runner/work/hello-qt5/hello-qt5/hello-qt6-build/src/AppDir/usr/share/applications/com.github.hello-qt6.desktop" -bundle-non-qt-libs -no-translations $gst_executables
#  ./linuxdeployqt-continuous-x86_64.AppImage "/home/runner/work/hello-qt5/hello-qt5/hello-qt6-build/src/AppDir/usr/share/applications/com.github.hello-qt6.desktop" -bundle-non-qt-libs -no-translations $gst_executables

#  if [[ "$webengine" == "true" ]]; then
#    # Copy some NSS3 files to prevent WebEngine crashes.
#    cp /usr/lib/x86_64-linux-gnu/nss/* ./AppDir/usr/lib/ -v
#  fi

#  ./linuxdeployqt-continuous-x86_64.AppImage "/home/runner/work/hello-qt5/hello-qt5/hello-qt6-build/src/AppDir/usr/share/applications/com.github.hello-qt6.desktop" -appimage -no-translations $gst_executables

  # Rename AppImaage.
#  set -- H*.AppImage
#  imagename="$1"
  
#  if [[ "$webengine" == "true" ]]; then
#    imagenewname="hello-qt6-${git_tag}-${git_revision}-linux64.AppImage"
#  else
#    imagenewname="hello-qt6-${git_tag}-${git_revision}-nowebengine-linux64.AppImage"
#  fi
#else
  # Fix .dylib linking.
#  install_name_tool -change "libhello-qt6.dylib" "@executable_path/libhello-qt6.dylib" "src/hello-qt6.app/Contents/MacOS/hello-qt6"
#  install_name_tool -change "libhello-qt6.dylib" "@executable_path/libhello-qt6.dylib" "src/hello-qt6"

#  otool -L "src/hello-qt6.app/Contents/MacOS/hello-qt6"
#  macdeployqt "src/hello-qt6.app" -dmg

  # Rename DMG.
#  set -- src/h*.dmg
#  imagename="$1"

#  if [[ "$webengine" == "true" ]]; then
#    imagenewname="hello-qt6-${git_tag}-${git_revision}-mac64.dmg"
#  else
#    imagenewname="hello-qt6-${git_tag}-${git_revision}-nowebengine-mac64.dmg"
#  fi
#fi

#mv "$imagename" "$imagenewname"

find .

pwd

ls
