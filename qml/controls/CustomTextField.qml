import QtQuick 2.0
import QtQuick.Controls 2.13
import QtGraphicalEffects 1.0

TextField {
    id: textField

    // Create custom properties
    property color colorDefault: "#282c34"
    property color colorOnFocus: "#242831"
    property color colorMouseOver: "#2b3f38"
    property string placeHolerValue: "Please type here"

    QtObject {
        id: internal
        property var dynamicColor: if (textField.focus) {
                                       textField.hovered ? colorOnFocus : colorDefault
                                   } else {
                                       textField.hovered ? colorMouseOver : colorDefault
                                   }
    }

    implicitWidth: 300
    implicitHeight: 40
    placeholderText: qsTr(placeHolerValue)
    color: "#ffffff"
    background: Rectangle {
        color: internal.dynamicColor
        radius: 10
    }
    selectByMouse: true
    selectionColor: "#ff007f"
    placeholderTextColor: "#81848c"
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:40;width:640}
}
##^##*/

