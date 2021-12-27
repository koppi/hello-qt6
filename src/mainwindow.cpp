#include <QDir>
#include <QDebug>

#include "mainwindow.h"
#include "ui_mainwindow.h"

void switchTranslator(QTranslator& translator, const QString& filename) {

    // remove the old translator
    qApp->removeTranslator(&translator);

    // load the new translator
    bool result = translator.load(filename);
    //qDebug("translator.load(%s) %s", filename.toLatin1().data(), result ? "true" : "false" );

    if(!result) {
        qWarning("*** Failed translator.load(\"%s\")", filename.toLatin1().data());
        return;
    }
    qApp->installTranslator(&translator);
}

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    createLanguageMenu();

    // macOS setNativeMenuBar(false)
    ui->menubar->setNativeMenuBar(false);

    QString resourceFileName = ":/resource/languages/de.qm";
    switchTranslator(m_translator, resourceFileName);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::changeEvent(QEvent* event) {
    if(0 != event) {
        switch(event->type()) {
        // this event is send if a translator is loaded
        case QEvent::LanguageChange:
            ui->retranslateUi(this);
            break;

            // this event is send, if the system, language changes
        case QEvent::LocaleChange:
        {
            QString locale = QLocale::system().name();
            locale.truncate(locale.lastIndexOf('_'));
            loadLanguage(locale);
        }
            break;
        default:
            break;
        }
    }
    QMainWindow::changeEvent(event);
}

void MainWindow::loadLanguage(const QString& rLanguage) {

    if(m_currLang != rLanguage) {
        m_currLang = rLanguage;
        QLocale locale = QLocale(m_currLang);
        QLocale::setDefault(locale);
        QString languageName = QLocale::languageToString(locale.language());
        switchTranslator(m_translator, QString("%1.qm").arg(rLanguage));
        ui->statusBar->showMessage(tr("Current language changed to %1.").arg(languageName));
    }
}

// Called every time, when a menu entry of the language menu is called
void MainWindow::slotLanguageChanged(QAction* action)
{
    if(0 != action) {
        // load the language dependant on the action content
        loadLanguage(action->data().toString());
    }
}

// we create the menu entries dynamically, dependent on the existing translations.
void MainWindow::createLanguageMenu(void) {
    QActionGroup* langGroup = new QActionGroup(ui->menu_Language);
    langGroup->setExclusive(true);

    connect(langGroup, SIGNAL (triggered(QAction *)), this, SLOT (slotLanguageChanged(QAction *)));

    // format systems language
    QString defaultLocale = QLocale::system().name(); // e.g. "de_DE"
    defaultLocale.truncate(defaultLocale.lastIndexOf('_')); // e.g. "de"

    m_langPath = ":/resource";
    m_langPath.append("/languages");

    QDir dir(m_langPath);
    QStringList fileNames = dir.entryList(QStringList("*.qm"));

    for (int i = 0; i < fileNames.size(); ++i) {
        // get locale extracted by filename
        QString locale;

        locale = fileNames[i]; // "de.qm"
        locale.truncate(locale.lastIndexOf('.')); // "de"

        QString lang = QLocale::languageToString(QLocale(locale).language());

        QAction *action = new QAction(lang, this);
        action->setCheckable(true);
        action->setData(QString(":/resource/languages/%1").arg(locale));

        ui->menu_Language->addAction(action);
        langGroup->addAction(action);

        // set default translators and language checked
        if (defaultLocale == locale) {
            action->setChecked(true);
        }
    }
}
