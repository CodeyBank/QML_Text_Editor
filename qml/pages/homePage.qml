import "../controls"
import QtQuick.Controls 2.15
import QtQuick 2.12
import QtQuick.Layouts 1.3

Item {
    Rectangle {
        id: rectangle
        color: "#2c313c"
        anchors.fill: parent
        Connections {
            target: backend
            function onSetName(stringText) {
                welcomeLabel.text = stringText
            }
            function onPrintTime(time) {
                dateLabel.text = time
            }
            function onIsVisible(isVisible) {
                rectangleVisible.visible = isVisible
            }
        }

        Rectangle {
            id: bgTextInput
            height: 50
            color: "#373e4c"
            anchors.top: parent.top
            anchors.topMargin: 40
            radius: 8
            anchors.right: parent.right
            anchors.rightMargin: 50
            anchors.left: parent.left
            anchors.leftMargin: 50

            GridLayout {
                id: gridLayout
                anchors.fill: parent
                columnSpacing: 2
                rowSpacing: 0
                layoutDirection: Qt.LeftToRight
                rows: 1
                columns: 3

                CustomTextField {
                    id: nameField
                    font.family: "Tahoma"
                    font.pointSize: 10
                    Layout.fillWidth: true
                    Layout.minimumWidth: 450
                    Layout.bottomMargin: 0
                    Layout.topMargin: 0
                    Layout.rightMargin: 10
                    Layout.leftMargin: 10
                    Keys.onEnterPressed: {
                        backend.welcomeText(nameField.text)
                    }
                    Keys.onReturnPressed: {
                        backend.welcomeText(nameField.text)
                    }
                }

                SelectButton {
                    id: changeNameBtn
                    width: 105
                    height: 34
                    text: "Change Name"
                    font.family: "Tahoma"
                    font.pointSize: 10
                    Layout.minimumHeight: 40
                    Layout.minimumWidth: 120
                    Layout.fillHeight: false
                    Layout.fillWidth: false
                    onClicked: {
                        backend.welcomeText(nameField.text)
                        //welcomeLabel.text = qsTr("Welcome, ") + nameField.text
                    }
                }

                Switch {
                    id: hideShowSwitch
                    checked: true
                    Layout.preferredHeight: 40
                    Layout.preferredWidth: 65

                    onToggled: {
                        backend.showHideRectangle(hideShowSwitch.checked)
                    }
                }
            }
        }

        Rectangle {
            id: rectangleVisible
            color: "#242831"
            anchors.top: bgTextInput.bottom
            anchors.topMargin: 15
            anchors.right: parent.right
            anchors.rightMargin: 50
            anchors.left: parent.left
            anchors.leftMargin: 50
            radius: 10
            visible: true
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 66

            Label {
                id: welcomeLabel
                x: 302
                width: 700
                height: 35
                color: "#646a70"
                text: qsTr("Welcome")
                horizontalAlignment: Text.AlignHCenter
                anchors.top: parent.top
                anchors.topMargin: 15
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 22
                font.family: "Tahoma"
            }

            Label {
                id: dateLabel
                x: 331
                color: "#75a3ca"
                text: qsTr("Date")
                anchors.horizontalCenterOffset: 0
                anchors.top: parent.top
                anchors.topMargin: 52
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 14
                font.family: "Tahoma"
            }

            Text {
                id: element1
                color: "#989898"
                text: qsTr("Nothing much to see here")
                anchors.right: parent.right
                anchors.rightMargin: 35
                anchors.left: parent.left
                anchors.leftMargin: 33
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 40
                anchors.top: parent.top
                anchors.topMargin: 88
                textFormat: Text.AutoText
                wrapMode: Text.WordWrap
                font.family: "Tahoma"
                font.pixelSize: 12
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:800}
}
##^##*/

