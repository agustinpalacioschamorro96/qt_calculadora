import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.0
import Calculadora 20.21        //Incluyo la librería donde está mi clase.

Window {
    id: window
    width: 219
    height: 300
    visible: true
    color: "#aed3f3"
    title: qsTr("Hello World")

    Calc{
        id: calculadora
    }

    TextField {
        id: renglon_inferior
        height: 40
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: renglon_superior.bottom
        anchors.topMargin: 6
        anchors.leftMargin: 10
        anchors.rightMargin: 9
        placeholderText: qsTr("Text Field")
    }

    TextField {
        id: renglon_superior
        height: 40
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 8
        anchors.leftMargin: 9
        anchors.rightMargin: 9
        placeholderText: qsTr("Text Field")
    }

    Column {
        id: column
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: renglon_inferior.bottom
        anchors.bottom: parent.top
        spacing: 7
        anchors.topMargin: 16
        anchors.bottomMargin: -288
        anchors.leftMargin: 13
        anchors.rightMargin: 9


        Grid {
            id: grid
            width: column.width
            height: column.heit * 0.8
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.rightMargin: 7
            anchors.leftMargin: 13
            spacing: 9
            verticalItemAlignment: Grid.AlignVCenter
            horizontalItemAlignment: Grid.AlignHCenter
            rows: 4
            columns: 4

            Button {
                id: button_1
                width: grid.width * 0.2
                height: grid.height * 0.2
                text: qsTr("1")
                onClicked: {
                    renglon_inferior.text += button_1.text   //+= es un append
                }
            }

            Button {
                id: button_2
                width: grid.width * 0.2
                height: grid.height * 0.2
                text: qsTr("2")
                onClicked: {
                    renglon_inferior.text += button_2.text   //+= es un append
                }
            }

            Button {
                id: button_3
                width: grid.width * 0.2
                height: grid.height * 0.2
                text: qsTr("3")
                onClicked: {
                    renglon_inferior.text += button_3.text   //+= es un append
                }
            }

            Button {
                id: div
                width: grid.width * 0.2
                height: grid.height * 0.2
                text: qsTr("/")
                onClicked: {
                    renglon_inferior.text += " " + div.text + " "
                }
            }

            Button {
                id: button_4
                width: grid.width * 0.2
                height: grid.height * 0.2
                text: qsTr("4")
                transformOrigin: Item.Center
                onClicked: {
                    renglon_inferior.text += button_4.text   //+= es un append
                }
            }

            Button {
                id: button_5
                width: grid.width * 0.2
                height: grid.height * 0.2
                text: qsTr("5")
                onClicked: {
                    renglon_inferior.text += button_5.text   //+= es un append
                }
            }

            Button {
                id: button_6
                width: grid.width * 0.2
                height: grid.height * 0.2
                text: qsTr("6")
                onClicked: {
                    renglon_inferior.text += button_6.text   //+= es un append
                }
            }

            Button {
                id: mult
                width: grid.width * 0.2
                height: grid.height * 0.2
                text: qsTr("*")
                onClicked: {
                    renglon_inferior.text += " " + mult.text + " "
                }
            }

            Button {
                id: button_7
                width: grid.width * 0.2
                height: grid.height * 0.2
                text: qsTr("7")
                onClicked: {
                    renglon_inferior.text += button_7.text   //+= es un append
                }
            }

            Button {
                id: button_8
                width: grid.width * 0.2
                height: grid.height * 0.2
                text: qsTr("8")
                onClicked: {
                    renglon_inferior.text += button_8.text   //+= es un append
                }

            }

            Button {
                id: button_9
                width: grid.width * 0.2
                height: grid.height * 0.2
                text: qsTr("9")

                onClicked: {
                    renglon_inferior.text += button_9.text   //+= es un append
                }
            }

            Button {
                id: sum
                width: grid.width * 0.2
                height: grid.height * 0.2
                text: qsTr("+")

                onClicked: {
                    renglon_inferior.text += " " + sum.text + " "  // En este paso se usa += ya que sino me reemplazaría el término que ya estaba.
                }
            }

            Button {
                id: button_0
                width: grid.width * 0.2
                height: grid.height * 0.2
                text: qsTr("0")
                onClicked: {
                    renglon_inferior.text += button_0.text   //+= es un append
                }
            }

            Button {
                id: button_punto
                width: grid.width * 0.2
                height: grid.height * 0.2
                text: qsTr(".")
                onClicked: {
                    renglon_inferior.text += button_punto.text   //+= es un append
                }
            }

            Button {
                id: borrar
                width: grid.width * 0.2
                height: grid.height * 0.2
                text: qsTr("CE")
                onClicked: {
                    renglon_inferior.clear()
                }
            }

            Button {
                id: rest
                width: grid.width * 0.2
                height: grid.height * 0.2
                text: qsTr("-")
                onClicked: {
                    renglon_inferior.text += " " + rest.text + " "
                }
            }
        }
        Button {
            id: igual
            width: column.width
            height: grid.height * 0.2
            text: qsTr("=")
            onClicked: {
                renglon_superior.text = renglon_inferior.text + " ="
                var datos = renglon_inferior.text.split(" ")

                if(renglon_inferior.text.split(" ")[1]=== "+")            //Como estan todos los string separados por espacios vamos a usar un split con espacios
                    renglon_inferior.text = calculadora.suma(datos[0],datos[2]) //Se usan 3 iguales por ser un lenguaje interpretado
                else if(datos[1] === "-")
                    renglon_inferior.text = calculadora.resta(datos[0],datos[2])
                else if(datos[1] === "*")
                    renglon_inferior.text = calculadora.multiplicacion(datos[0],datos[2])
                else if(datos[1] === "/")
                    renglon_inferior.text = calculadora.division(datos[0],datos[2])

            }
        }
    }

}



/*##^##
Designer {
    D{i:0;formeditorZoom:1.25}D{i:2}D{i:3}D{i:4}
}
##^##*/
