#include "calc.h"
#include <QString>

calc::calc(QObject *parent) : QObject(parent)
{

}

//Implementación
float calc::suma(float a, float b) //nombre de la clase/ nombre del metodo
{ return a+b;}

float calc::resta(float a, float b)
{ return a-b; }

float calc::multiplicacion(float a, float b)
{ return a*b; }

float calc::division(float a, float b)
{ return a/b; }
