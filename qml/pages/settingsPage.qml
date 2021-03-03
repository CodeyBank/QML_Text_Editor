import "../controls"
import QtQuick 2.0
import QtQuick.Controls 2.13

Item {
    Rectangle {
        id: rectangle
        color: "#2c313c"
        anchors.fill: parent

        Label {
            id: label
            x: 312
            y: 239
            width: 139
            height: 36
            color: "#dfeefe"
            text: qsTr("Settings Page")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 16
        }
    }
}
/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:800}
}
##^##*/

