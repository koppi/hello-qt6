#CONFIG += static

#QMAKE_LFLAGS += -static -static-libgcc
#QMAKE_CFLAGS_RELEASE -= -O2
#QMAKE_CFLAGS_RELEASE += -Os -momit-leaf-frame-pointer
#DEFINES += QT_STATIC_BUILD

QT += core gui
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TEMPLATE = app
TARGET = hello-qt5
CONFIG += warn_on

INCLUDEPATH += .

DESTDIR = ../bin
MOC_DIR = ../build/moc
RCC_DIR = ../build/rcc
UI_DIR = ../build/ui
unix:OBJECTS_DIR = ../build/o/unix
win32:OBJECTS_DIR = ../build/o/win32
macx:OBJECTS_DIR = ../build/o/mac

# Input
SOURCES += hello.cpp \
    mainwindow.cpp

FORMS += \
    mainwindow.ui

HEADERS += \
    mainwindow.h

TRANSLATIONS = languages/en.ts  languages/de.ts languages/ca.ts

DISTFILES += \
    languages/de.ts \
    languages/en.ts \
    languages/ca.ts \
    README.md

RESOURCES += \
    res/translation.qrc
