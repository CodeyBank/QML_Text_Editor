import QtQuick 2.10
import QtQuick.Controls 2.13
import QtGraphicalEffects 1.0

Button {
    id: btnToggle

    // ADDING CUSTOM PROPERTIES
    property url btnIconSource: "../../images/svg_icons/svg_images/menu_icon.svg"
    property color btnColorDefault: "#2b2c31"
    property color btnColorMouseOver: "#2a1b31"
    property color btnColorClicked: "#2b1cee"

    QtObject{
        id: internal

        //MOUSOVER AND MOUSECLICK COLORS
        property var dynamicColor: if(btnToggle.down){
                                        btnToggle.down ? btnColorClicked : btnColorDefault
                                  }else{
                                        btnToggle.hovered ? btnColorMouseOver : btnColorDefault
                                   }

    }

    implicitWidth: 70
    implicitHeight: 60

    background: Rectangle{
        id: bgBtn
        color: internal.dynamicColor

        Image {
            id: iconBtn
            source: "../../images/svg_icons/svg_images/menu_icon.svg"
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            height: 25
            width: 25
            fillMode: Image.PreserveAspectFit
            visible: false
        }

        ColorOverlay{
            anchors.fill: iconBtn
            source: iconBtn
            color: "#ffffff"
            antialiasing: false
        }

    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:35;width:35}
}
##^##*/
