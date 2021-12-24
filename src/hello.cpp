#include <QApplication>
#include <QPushButton>

#include <QDebug>

int main(int argc, char *argv[]) {
    QApplication a(argc, argv);

    qDebug() << "Hello World";

    QWidget window;
    window.setFixedSize(200, 50);

    QFont font ("Courier");
    
    QPushButton *button = new QPushButton("Hello World", &window);
    button->setGeometry(10, 10, 180, 30);
    button->setToolTip("A tooltip");
    button->setFont(font);

    QObject::connect(button, SIGNAL (clicked()),
                     QApplication::instance(), SLOT (quit()));
    
    window.show();
    
    return a.exec();
}
