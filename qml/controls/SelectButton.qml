import QtQuick 2.0
import QtQuick.Controls 2.13
import QtGraphicalEffects 1.0

Button {
    id: buttonSelect

    // Create custom properties
    property color colorDefault: "#4891d9"
    property color colorMouseOver: "#55aaff"
    property color colorPressed: "#3f7dbd"

    width: 100
    height: 40

    QtObject{
        id: internal
        property var dynamicColor: if (buttonSelect.down){
                                        buttonSelect.down ? colorPressed : colorDefault
                                   }else{
                                        buttonSelect.hovered ? colorMouseOver : colorDefault
                                   }
    }

    text: qsTr("Select")
    contentItem: Item {
        Text {
            id: name
            text: buttonSelect.text
            font: buttonSelect.font
            color: "#ffffff"
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
    background: Rectangle{
        color: internal.dynamicColor
        radius: 10
    }
}

