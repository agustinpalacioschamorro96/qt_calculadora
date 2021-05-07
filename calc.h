#ifndef CALC_H
#define CALC_H

#include <QObject>

class calc : public QObject
{
    Q_OBJECT
public:
    explicit calc(QObject *parent = nullptr);

public slots: //Los slots son un equivalente a mètodos pùblicos para QML.

    float suma(float a, float b); //Definicion del perfil
    float resta(float a, float b);
    float multiplicacion(float a, float b);
    float division(float a, float b);

private:

signals:

};

#endif // CALC_H
