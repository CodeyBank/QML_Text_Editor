import QtQuick 2.0
import QtQuick.Controls 2.15

Item {
    property color borderColor: "#ffffff"
    property color onHoverColor: "#f6b2ff"
    property string getText: textArea.text
    property string setText: ""

    Rectangle {
        id: baseRect
        color: "#505a6f"
        anchors.fill: parent

        Flickable {
            id: flickable
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 40
            anchors.leftMargin: 40
            anchors.bottomMargin: 40
            anchors.topMargin: 40
            clip: true

            TextArea.flickable: TextArea {
                id: textArea
                padding: 10
                wrapMode: Text.WordWrap
                placeholderTextColor: "#f6fbff"
                textFormat: Text.AutoText
                selectByMouse: true
                selectedTextColor: "#ffffff"
                font.pointSize: 12
                color: "#ffffff"
                text: setText
            }
            ScrollBar.vertical: ScrollBar {}
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

