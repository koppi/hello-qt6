# Install all files on Linux.
unix:!mac:!android {
  target.path = $$PREFIX/bin

  desktop_file.files = ../../resources/desktop/$${APP_REVERSE_NAME}.desktop
  desktop_file.path = $$quote($$PREFIX/share/applications/)

  appdata.files = ../../resources/desktop/$${APP_REVERSE_NAME}.appdata.xml
  appdata.path = $$quote($$PREFIX/share/metainfo/)

  desktop_icon.files = ../../resources/graphics/$${TARGET}.png
  desktop_icon.path = $$quote($$PREFIX/share/icons/hicolor/512x512/apps/)

  INSTALLS += target desktop_file desktop_icon appdata
}

mac {
  IDENTIFIER = $$APP_REVERSE_NAME
  CONFIG -= app_bundle
  ICON = ../../resources/macosx/$${TARGET}.icns
  QMAKE_MACOSX_DEPLOYMENT_TARGET = 10.10
  LIBS += -framework AppKit

  target.path = $$quote($$PREFIX/Contents/MacOS/)

  # Install app icon.
  icns_icon.files = ../resources/macosx/$${TARGET}.icns
  icns_icon.path = $$quote($$PREFIX/Contents/Resources/)

  # Install Info.plist.
  info_plist.files = ../resources/macosx/Info.plist.in
  info_plist.path  = $$quote($$PREFIX/Contents/)

  # Process the just installed Info.plist.
  info_plist2.extra = @sed -e "s,@EXECUTABLE@,$$TARGET,g" -e "s,@SHORT_VERSION@,$$APP_VERSION,g" -e "s,@APP_NAME@,\"$$APP_NAME\",g" -e "s,@ICON@,$$basename(ICON),g"  -e "s,@TYPEINFO@,"????",g" $$shell_quote($$PREFIX/Contents/Info.plist.in) > $$shell_quote($$PREFIX/Contents/Info.plist) && \
                      rm -f $$shell_quote($$PREFIX/Contents/Info.plist.in)
  info_plist2.path = $$quote($$PREFIX/Contents/)

  # Install PkgInfo
  pkginfo.extra = @printf "APPL????" > $$shell_quote($$PREFIX/Contents/PkgInfo)
  pkginfo.path = $$quote($$PREFIX/Contents/)

  INSTALLS += target icns_icon info_plist info_plist2 pkginfo
}

message($$MSG_PREFIX: Prefix for headers is \"$$INSTALL_HEADERS_PREFIX\".)

# Create install step for each folder of public headers.
for(header, INSTALL_HEADERS) {
  path = $${INSTALL_HEADERS_PREFIX}/$${dirname(header)}
  path = $$shell_quote($$path)

  message($$MSG_PREFIX: Adding header \"$$header\" to \"make install\" step with path \"$$path\".)

  eval(headers_$${dirname(header)}.files += $$header)
  eval(headers_$${dirname(header)}.path = $$path)
  eval(INSTALLS *= headers_$${dirname(header)})
}
