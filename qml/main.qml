import QtQuick.Controls 2.13
import QtQuick 2.12
import QtQuick.Window 2.10
import "controls"
import QtGraphicalEffects 1.0
import QtQuick.Dialogs 1.3

Window {
    id: mainwindow
    title: qsTr("Qt Quick Window")
    width: 1000
    height: 580
    minimumWidth: 800
    minimumHeight: 500
    color: "#00000000"
    visible: true

    // Window properties. 0 means the window isnt maximized
    property int windowStatus: 0
    // window margins
    property int windowMargin: 10

    // Text edit properies
    property alias actualPage: stackView.currentItem

    // Remove the title  bar
    flags: Qt.Window | Qt.FramelessWindowHint

    // Internal Fucntions
    QtObject {
        id: internal
        function resetResizeWindows() {
            // Hide resize effects
            resizeBottom.visible = true
            resizeLeft.visible = true
            resizeRight.visible = true
            diagResize.visible = true
        }

        function maximizeRestore() {
            if (windowStatus == 0) {
                mainwindow.showMaximized()
                windowStatus = 1
                windowMargin = 0
                btnMaximizeRestore.btnIconSource = "../images/svg_icons/svg_images/restore_icon.svg"
                // Hide resize effects
                resizeBottom.visible = false
                resizeLeft.visible = false
                resizeRight.visible = false
                diagResize.visible = false
            } else {
                mainwindow.showNormal()
                windowStatus = 0
                windowMargin = 10
                internal.resetResizeWindows()
                btnMaximizeRestore.btnIconSource
                        = "../images/svg_icons/svg_images/maximize_icon.svg"
            }
        }

        function ifMaximisedWindowRestore() {
            if (windowStatus == 0) {
                mainwindow.showNormal()
                windowStatus = 0
                windowMargin = 10
                internal.resetResizeWindows()
                btnMaximizeRestore.btnIconSource
                        = "../images/svg_icons/svg_images/maximize_icon.svg"
            }
        }
        function restoreMargins() {
            windowMargin = 10
            windowStatus = 0
            internal.resetResizeWindows()
            btnMaximizeRestore.btnIconSource = "../images/svg_icons/svg_images/maximize_icon.svg"
        }
    }

    Rectangle {
        Connections {
            target: backend
            function onReadTextSignal(textRead) {
                actualPage.setText = textRead
            }
        }

        id: bg
        color: "#2c313c"
        border.color: "#343644"
        anchors.right: parent.right
        anchors.rightMargin: windowMargin
        anchors.left: parent.left
        anchors.leftMargin: windowMargin
        anchors.bottom: parent.bottom
        anchors.bottomMargin: windowMargin
        anchors.top: parent.top
        anchors.topMargin: windowMargin
        z: 1

        Rectangle {
            id: appContainer
            color: "#00000000"
            anchors.rightMargin: 1
            anchors.leftMargin: 1
            anchors.bottomMargin: 1
            anchors.topMargin: 1
            anchors.fill: parent
            border.color: "#383e4c"

            Rectangle {
                id: topBar
                height: 60
                color: "#2b2c31"
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.top: parent.top
                anchors.topMargin: 0

                ToggleBtn {
                    onClicked: animationMenu.running = true
                    btnColorClicked: "#0e0f11"
                    btnColorMouseOver: "#5b5d68"
                }

                Rectangle {
                    id: rectangle
                    y: 21
                    height: 25
                    color: "#282c34"
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                    anchors.left: parent.left
                    anchors.leftMargin: 70
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 0

                    Label {
                        id: labelTopInfo
                        color: "#707d99"
                        text: qsTr("App Information")
                        font.family: "Montserrat"
                        font.pointSize: 10
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignLeft
                        anchors.right: parent.right
                        anchors.rightMargin: 300
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 0
                        anchors.top: parent.top
                        anchors.topMargin: 0
                    }

                    Label {
                        id: labelRightInfo
                        color: "#707d99"
                        text: qsTr("| HOME")
                        anchors.leftMargin: 0
                        font.pointSize: 10
                        anchors.rightMargin: 10
                        horizontalAlignment: Text.AlignRight
                        anchors.topMargin: 0
                        verticalAlignment: Text.AlignVCenter
                        anchors.right: parent.right
                        anchors.left: labelTopInfo.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        font.family: "Montserrat"
                        anchors.bottomMargin: 0
                    }
                }

                Rectangle {
                    id: titleBar
                    width: 200
                    height: 35
                    color: "#00000000"
                    anchors.right: parent.right
                    anchors.rightMargin: 105
                    anchors.left: parent.left
                    anchors.leftMargin: 70
                    anchors.top: parent.top
                    anchors.topMargin: 0

                    DragHandler {
                        onActiveChanged: if (active) {
                                             mainwindow.startSystemMove()
                                             internal.ifMaximisedWindowRestore()
                                         }
                    }

                    Image {
                        id: iconApp
                        width: 28
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 0
                        anchors.top: parent.top
                        anchors.topMargin: 0
                        source: "../images/svg_icons/svg_images/icon_app_top.svg"
                        fillMode: Image.PreserveAspectFit
                    }

                    Label {
                        id: labelTitle
                        color: "#ffffff"
                        text: qsTr("My simple application")
                        font.family: "Montserrat"
                        font.pointSize: 10
                        verticalAlignment: Text.AlignVCenter
                        styleColor: "#fff7f7"
                        anchors.left: iconApp.right
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        anchors.top: parent.top
                        anchors.leftMargin: 5
                    }
                }

                Row {
                    id: row
                    x: 905
                    width: 105
                    height: 35
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                    anchors.top: parent.top
                    anchors.topMargin: 0

                    TopBarBtn {
                        id: btnMinimize
                        btnColorMouseOver: "#5b5d68"
                        btnColorClicked: "#2b2c31"
                        onClicked: {
                            mainwindow.showMinimized()
                            internal.restoreMargins()
                        }
                    }

                    TopBarBtn {
                        id: btnMaximizeRestore
                        btnIconSource: "../images/svg_icons/svg_images/maximize_icon.svg"
                        btnColorClicked: "#2b2c31"
                        btnColorMouseOver: "#5b5d68"
                        onClicked: internal.maximizeRestore()
                    }

                    TopBarBtn {
                        id: btnClose
                        btnIconSource: "../images/svg_icons/svg_images/close_icon.svg"
                        btnColorClicked: "#3e054f"
                        btnColorMouseOver: "#bf0d44"
                        onClicked: mainwindow.close()
                    }
                }
            }

            Rectangle {
                id: content
                color: "#00000000"
                border.color: "#00000000"
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                anchors.top: topBar.bottom
                anchors.topMargin: 0

                Rectangle {
                    id: leftMenu
                    width: 70
                    color: "#2b2c31"
                    border.color: "#00000000"
                    border.width: 1
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 0
                    anchors.top: parent.top
                    anchors.topMargin: 0

                    PropertyAnimation {
                        id: animationMenu
                        target: leftMenu
                        property: "width"
                        to: if (leftMenu.width == 70)
                                return 200
                            else
                                return 70
                        duration: 500
                        easing.type: Easing.OutBounce
                    }

                    Column {
                        id: column
                        width: 250
                        anchors.right: parent.right
                        anchors.rightMargin: 0
                        anchors.left: parent.left
                        anchors.leftMargin: 0
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 90
                        anchors.top: parent.top
                        anchors.topMargin: 0

                        LefMenuBtn {
                            id: btnHome
                            width: leftMenu.width
                            height: 60
                            text: qsTr("Home")
                            display: AbstractButton.TextOnly
                            isActiveMenu: true
                            onClicked: {
                                btnHome.isActiveMenu = true
                                btnSaveMenu.isActiveMenu = false
                                btnFileMenu.isActiveMenu = false
                                btnSettings.isActiveMenu = false
                                stackView.push(Qt.resolvedUrl(
                                                   "pages/homePage.qml"))
                                //pagesView.setSource("pages/homePage.qml")
                            }
                        }

                        LefMenuBtn {
                            id: btnFileMenu
                            width: leftMenu.width
                            height: 60
                            text: qsTr("Files")
                            btnIconSource: "../images/svg_icons/svg_images/open_icon.svg"
                            isActiveMenu: false
                            display: AbstractButton.TextOnly
                            onPressed: {
                                fileOpen.open()
                            }
                            FileDialog {
                                id: fileOpen
                                title: "Please Choose a file"
                                folder: shortcuts.home
                                selectMultiple: false
                                nameFilters: ["Text file(*.txt)"]
                                onAccepted: {
                                    backend.openFile(fileOpen.fileUrl)
                                }
                            }
                        }

                        LefMenuBtn {
                            id: btnSaveMenu
                            width: leftMenu.width
                            height: 60
                            text: qsTr("Save")
                            btnIconSource: "../images/svg_icons/svg_images/save_icon.svg"
                            isActiveMenu: false
                            display: AbstractButton.TextOnly
                            onPressed: {
                                fileSave.open()
                            }
                            FileDialog {
                                id: fileSave
                                title: "Please Choose where to save file"
                                folder: shortcuts.home
                                selectExisting: false
                                nameFilters: ["Text file(*.txt)"]
                                onAccepted: {
                                    backend.getTextFile(actualPage.getText)
                                    backend.writeFile(fileSave.fileUrl)
                                }
                            }
                        }
                    }
                }

                LefMenuBtn {
                    id: btnSettings
                    x: 0
                    y: 180
                    width: leftMenu.width
                    height: 60
                    text: qsTr("Settings")
                    btnIconSource: "../images/svg_icons/svg_images/settings_icon.svg"
                    clip: true
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 25
                    isActiveMenu: false
                    display: AbstractButton.TextOnly

                    onClicked: {
                        btnHome.isActiveMenu = false
                        btnSaveMenu.isActiveMenu = false
                        btnFileMenu.isActiveMenu = false
                        btnSettings.isActiveMenu = true
                        stackView.push(Qt.resolvedUrl("pages/settingsPage.qml"))
                        //pagesView.setSource("pages/settingsPage.qml")
                    }
                }

                Rectangle {
                    id: contentPages
                    color: "#2c313c"
                    clip: true
                    border.color: "#00000000"
                    anchors.right: parent.right
                    anchors.rightMargin: -1
                    anchors.left: leftMenu.right
                    anchors.leftMargin: 1
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 25
                    anchors.top: parent.top
                    anchors.topMargin: 0

                    StackView {
                        id: stackView
                        anchors.fill: parent
                        initialItem: Qt.resolvedUrl("pages/textEditor.qml")
                    }

                    //                    Loader{
                    //                        id: pagesView
                    //                        anchors.fill: parent
                    //                        source: Qt.resolvedUrl("pages/homePage.qml")
                    //                    }
                }

                Rectangle {
                    id: bottomCredits
                    color: "#282c34"
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                    anchors.left: leftMenu.right
                    anchors.leftMargin: 1
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 0
                    anchors.top: contentPages.bottom
                    anchors.topMargin: 0

                    Label {
                        id: credits
                        color: "#707d99"
                        text: qsTr("App Credits")
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.rightMargin: 30
                        anchors.bottom: parent.bottom
                        font.family: "Montserrat"
                        verticalAlignment: Text.AlignVCenter
                        anchors.topMargin: 0
                        font.pointSize: 10
                        horizontalAlignment: Text.AlignLeft
                        anchors.bottomMargin: 0
                        anchors.right: parent.right
                        anchors.leftMargin: 10
                    }

                    MouseArea {
                        id: diagResize
                        x: 881
                        y: 0
                        width: 25
                        height: 25
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 0
                        anchors.right: parent.right
                        anchors.rightMargin: 0
                        cursorShape: Qt.SizeFDiagCursor

                        DragHandler {
                            target: null
                            onActiveChanged: if (active) {
                                                 mainwindow.startSystemResize(
                                                             Qt.RightEdge | Qt.BottomEdge)
                                             }
                        }

                        Image {
                            id: resizeIcon
                            width: 16
                            height: 16
                            opacity: 0.4
                            anchors.leftMargin: 5
                            anchors.topMargin: 5
                            anchors.fill: parent
                            sourceSize.height: 16
                            sourceSize.width: 16
                            source: "../images/svg_icons/svg_images/resize_icon.svg"
                            fillMode: Image.PreserveAspectFit
                            antialiasing: false
                        }
                    }
                }
            }
        }
    }
    DropShadow {
        anchors.fill: bg
        horizontalOffset: 0
        verticalOffset: 0
        radius: 10
        samples: 16
        color: "#80000000"
        source: bg
        z: 0
    }

    MouseArea {
        id: resizeLeft
        width: 10
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10
        cursorShape: Qt.SizeHorCursor

        DragHandler {
            target: null
            onActiveChanged: if (active) {
                                 mainwindow.startSystemResize(Qt.LeftEdge)
                             }
        }
    }
    MouseArea {
        id: resizeRight
        width: 10
        anchors.right: parent.right
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10
        cursorShape: Qt.SizeHorCursor

        DragHandler {
            target: null
            onActiveChanged: if (active) {
                                 mainwindow.startSystemResize(Qt.RightEdge)
                             }
        }
    }
    MouseArea {
        id: resizeBottom
        height: 10
        anchors.top: bg.bottom
        anchors.topMargin: 0
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        cursorShape: Qt.SizeVerCursor

        DragHandler {
            target: null
            onActiveChanged: if (active) {
                                 mainwindow.startSystemResize(Qt.BottomEdge)
                             }
        }
    }
}
