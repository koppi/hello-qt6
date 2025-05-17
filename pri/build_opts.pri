CONFIG *= c++1z warn_on

!os2 {
  CONFIG *= resources_big
}

CONFIG -=  debug_and_release
DEFINES *= QT_USE_QSTRINGBUILDER QT_USE_FAST_CONCATENATION QT_USE_FAST_OPERATOR_PLUS UNICODE _UNICODE
VERSION = $$APP_VERSION
QT *= core widgets

gcc|g++|clang* {
  QMAKE_CXXFLAGS *= -std=c++17
}

msvc {
  QMAKE_CXXFLAGS *= /std:c++17
  QMAKE_CXXFLAGS *= /wd5240
}

clang* {
  DEFINES *= CLANG=1
}

# Setup specific compiler options.
CONFIG(release, debug|release) {
  message($$MSG_PREFIX: Building in "release" mode.)

  gcc:QMAKE_CXXFLAGS_RELEASE -= -O2
  clang:QMAKE_CXXFLAGS_RELEASE -= -O2
  gcc:QMAKE_CXXFLAGS_RELEASE *= -O3
  clang:QMAKE_CXXFLAGS_RELEASE *= -O3
}
else {
  message($$MSG_PREFIX: Building in "debug" mode.)

  DEFINES *= DEBUG=1
  gcc:QMAKE_CXXFLAGS_DEBUG *= -Wall
  clang:QMAKE_CXXFLAGS_DEBUG *= -Wall
  msvc:QMAKE_CXXFLAGS_DEBUG *= /W4 /wd4127
  msvc:QMAKE_CXXFLAGS_WARN_ON = ""
  msvc:QMAKE_CXXFLAGS_DEBUG -= /W3
  msvc:QMAKE_CXXFLAGS -= /W3
}

MOC_DIR = $$OUT_PWD/moc
RCC_DIR = $$OUT_PWD/rcc
UI_DIR = $$OUT_PWD/ui

mac:qtHaveModule(macextras) {
  QT *= macextras
}

# Make needed tweaks for RC file getting generated on Windows.
win32 {
  #RC_ICONS = ../../resources/graphics/hello-qt6.ico
  QMAKE_TARGET_COMPANY = $$APP_AUTHOR
  QMAKE_TARGET_DESCRIPTION = $$APP_NAME
  QMAKE_TARGET_COPYRIGHT = $$APP_COPYRIGHT
  QMAKE_TARGET_PRODUCT = $$APP_NAME
  
  # Additionally link against Shell32.
  LIBS *= Shell32.lib
}

static {
  message($$MSG_PREFIX: Building static version of library.)
}
else {
  message($$MSG_PREFIX: Building shared version of library.)
}
