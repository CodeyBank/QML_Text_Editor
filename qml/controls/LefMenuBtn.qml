import QtQuick 2.10
import QtQuick.Controls 2.13
import QtGraphicalEffects 1.0

Button {
    text: qsTr("Left Menu Text")
    id: btnLeftMenu

    // ADDING CUSTOM PROPERTIES
    property url btnIconSource: "../../images/svg_icons/svg_images/home_icon.svg"
    property color btnColorDefault: "#2b2c31"
    property color btnColorMouseOver: "#2a1b31"
    property color btnColorClicked: "#2b1cee"
    property int iconWidth: 18
    property int iconHeight: 18
    property color textFontColor: "#ffffff"
    property color activeMenuColor: "#00aaff"
    property bool isActiveMenu: false
    property color activeMenuColorRight: "#2c313c"

    QtObject{
        id: internal

        //MOUSOVER AND MOUSECLICK COLORS
        property var dynamicColor: if(btnLeftMenu.down){
                                        btnLeftMenu.down ? btnColorClicked : btnColorDefault
                                  }else{
                                        btnLeftMenu.hovered ? btnColorMouseOver : btnColorDefault
                                   }

    }

    width: 35
    height: 35

    background: Rectangle{
        id: bgBtn
        color: internal.dynamicColor

        Rectangle{
            anchors{
                top: parent.top
                left: parent.left
                bottom: parent.bottom
             }
            color: activeMenuColor
            width: 3
            visible: isActiveMenu
        }
        Rectangle{
            anchors{
                top: parent.top
                right: parent.right
                bottom: parent.bottom
            }
            width: 5
            color: "#8a91a0"
            anchors.leftMargin: 0
            visible: isActiveMenu
        }
    }

    contentItem: Item {
        anchors.fill: parent
        id: content

        Image {
            id: iconBtn
            source: btnIconSource
            anchors.verticalCenter: parent.verticalCenter
            sourceSize.width: iconWidth
            sourceSize.height: iconHeight
            width: iconWidth
            height: iconHeight
            anchors.left: parent.left
            anchors.leftMargin: 26
            fillMode: Image.PreserveAspectFit
            visible: true
            antialiasing: true
        }

        ColorOverlay{
            anchors.fill: iconBtn
            source: iconBtn
            color: "#ffffff"
            anchors.verticalCenter: parent.verticalCenter
            antialiasing: true
            width: iconWidth
            height: iconHeight
        }
        Text {
            id: description
            text: btnLeftMenu.text
            anchors.leftMargin: 100
            color: textFontColor
            font: btnLeftMenu.font
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
        }
    }


    }



/*##^##
Designer {
    D{i:0;height:60;width:250}D{i:6;anchors_height:18;anchors_width:18}
}
##^##*/
