TEMPLATE = app
TARGET = hello-qt6

MSG_PREFIX = "hello-qt6"
APP_TYPE = "executable"

include(../pri/vars.pri)

isEmpty(PREFIX) {
  message($$MSG_PREFIX: PREFIX variable is not set. This might indicate error.)

  win32|os2|android {
    PREFIX = $$OUT_PWD/app
  }

  mac {
    PREFIX = $$quote($$OUT_PWD/$${APP_NAME}.app)
  }

  unix:!mac:!android {
    PREFIX = $$OUT_PWD/usr
  }
}

include(../pri/defs.pri)

message($$MSG_PREFIX: Current directory \"$$PWD\".)
message($$MSG_PREFIX: Shadow copy build directory \"$$OUT_PWD\".)
message($$MSG_PREFIX: $$APP_NAME version is: \"$$APP_VERSION\".)
message($$MSG_PREFIX: Detected Qt version: \"$$QT_VERSION\".)
message($$MSG_PREFIX: Build destination directory: \"$$DESTDIR\".)
message($$MSG_PREFIX: Prefix directory: \"$$PREFIX\".)
message($$MSG_PREFIX: Build revision: \"$$APP_REVISION\".)

include(../pri/build_opts.pri)

SOURCES += hello.cpp \
    mainwindow.cpp

FORMS += \
    mainwindow.ui

HEADERS += \
    mainwindow.h

TRANSLATIONS = \
    languages/bg.ts \
    languages/en.ts \
    languages/de.ts \
    languages/ca.ts \
    languages/da.ts \
    languages/el.ts \
    languages/eo.ts \
    languages/es.ts \
    languages/et.ts \
    languages/eu.ts \
    languages/fa.ts \
    languages/fi.ts \
    languages/fr.ts \
    languages/ga.ts \
    languages/gl.ts \
    languages/he.ts \
    languages/hr.ts \
    languages/hu.ts \
    languages/id.ts \
    languages/ja.ts \
    languages/it.ts \
    languages/ka.ts \
    languages/ko.ts \
    languages/lv.ts \
    languages/ms.ts \
    languages/nb.ts \
    languages/nl.ts \
    languages/nn.ts \
    languages/pl.ts \
    languages/pt.ts \
    languages/ru.ts \
    languages/ro.ts \
    languages/sk.ts \
    languages/sl.ts \
    languages/sr.ts \
    languages/sv.ts \
    languages/th.ts \
    languages/tr.ts \
    languages/uk.ts \
    languages/vi.ts \
    languages/zh_CN.ts \
    languages/zh_TW.ts

DISTFILES += \
    languages/bg.ts \
    languages/de.ts \
    languages/en.ts \
    languages/ca.ts \
    languages/da.ts \
    languages/el.ts \
    languages/eo.ts \
    languages/es.ts \
    languages/et.ts \
    languages/eu.ts \
    languages/fa.ts \
    languages/fi.ts \
    languages/fr.ts \
    languages/ga.ts \
    languages/gl.ts \
    languages/he.ts \
    languages/hr.ts \
    languages/hu.ts \
    languages/id.ts \
    languages/it.ts \
    languages/ja.ts \
    languages/ka.ts \
    languages/ko.ts \
    languages/lv.ts \
    languages/ms.ts \
    languages/nb.ts \
    languages/nl.ts \
    languages/nn.ts \
    languages/pl.ts \
    languages/pt.ts \
    languages/ro.ts \
    languages/ru.ts \
    languages/sk.ts \
    languages/sl.ts \
    languages/sr.ts \
    languages/sv.ts \
    languages/th.ts \
    languages/tr.ts \
    languages/uk.ts \
    languages/vi.ts \
    languages/zh_CN.ts \
    languages/zh_TW.ts \
    README.md

RESOURCES += \
    res/translation.qrc \
    res/hello-qt6.qrc

unix {
    RESOURCES += res/icons.qrc
}

mac|os2|win32 {
  RESOURCES += res/icons.qrc
  DISTFILES += ../resources/desktop/com.github.hello-qt6.desktop
  DISTFILES += ../resources/desktop/com.github.hello-qt6.appdata.xml
}

win32 {
# Prepare files for NSIS.
  SEDREPLACE = "| ForEach-Object { $_ -replace '@APP_VERSION@', '$$APP_VERSION' -replace '@APP_REVISION@', '$$APP_REVISION' -replace '@APP_NAME@', '$$APP_NAME' -replace '@APP_LOW_NAME@', '$$APP_LOW_NAME' -replace '@EXE_NAME@', '$${APP_LOW_NAME}.exe' -replace '@PWD@', '$$replace(PWD, /, \\\\)' -replace '@OUT_PWD@', '$$replace(OUT_PWD, /, \\\\)' }"
  message($$MSG_PREFIX: Sed replace string: \"$$SEDREPLACE\")

  FULLSEDCMD = "powershell -Command \"cat $$shell_path($$shell_quote($$PWD/../../resources/nsis/NSIS.definitions.nsh.in)) $$SEDREPLACE | Out-File $$shell_path($$shell_quote($$OUT_PWD/NSIS.definitions.nsh))\""
  message($$MSG_PREFIX: Full powershell command: $$FULLSEDCMD)

  system(xcopy /Y $$shell_path($$shell_quote($$PWD/../../resources/nsis/NSIS.template.in)) $$shell_path($$shell_quote($$OUT_PWD/)))
  system($$FULLSEDCMD)
}

include(../pri/install.pri)
