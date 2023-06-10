import QtQuick 2.14
import QtQuick.Controls 2.14


Item {
    id:root
    anchors.fill:parent

    Rectangle {
        color: "#333333"
        width:300
        height:300
        opacity: 0.5
        anchors.centerIn: parent
        Button {
            id:txtHello
            text: qsTr("Hello")
            anchors.centerIn: parent
            onClicked:{
                txtHello.text = "Hello Clicked"
            }
        }
    }
}