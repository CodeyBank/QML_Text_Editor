import QtQuick 2.10
import QtQuick.Controls 2.13
import QtGraphicalEffects 1.0

Button {
    id: btnTopBar

    // ADDING CUSTOM PROPERTIES
    property url btnIconSource: "../../images/svg_icons/svg_images/minimize_icon.svg"
    property color btnColorDefault: "#2b2c31"
    property color btnColorMouseOver: "#2a1b31"
    property color btnColorClicked: "#2b1cee"

    QtObject{
        id: internal

        //MOUSOVER AND MOUSECLICK COLORS
        property var dynamicColor: if(btnTopBar.down){
                                        btnTopBar.down ? btnColorClicked : btnColorDefault
                                  }else{
                                        btnTopBar.hovered ? btnColorMouseOver : btnColorDefault
                                   }

    }

    width: 35
    height: 35

    background: Rectangle{
        id: bgBtn
        color: internal.dynamicColor

        Image {
            id: iconBtn
            source: btnIconSource
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            height: 16
            width: 16
            fillMode: Image.PreserveAspectFit
            visible: true
        }

        ColorOverlay{
            anchors.fill: iconBtn
            source: iconBtn
            color: "#ffffff"
            antialiasing: false
        }

    }
}


