#include <QApplication>
#include "mainwindow.h"

int main(int argc, char *argv[]) {
    Q_INIT_RESOURCE(translation);
    Q_INIT_RESOURCE(icons);
    Q_INIT_RESOURCE(hello_qt6);
    
    QApplication app(argc, argv);

    MainWindow window;
    window.show();
    
    return app.exec();
}
