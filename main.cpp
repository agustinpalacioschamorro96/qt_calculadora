#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "calc.h"                   //Incluyo mi clase calc.h
#include <QQmlComponent>            //Librería para vincular el backend con el frontend
                                    //Para registrar componentes QML

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    qmlRegisterType<calc>("Calculadora",20,21,"Calc");  //Registro mi clase para que sea accedida por el front end.

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
