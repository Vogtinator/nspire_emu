import QtQuick 2.0
import QtQuick.Layouts 1.0
import Ndless.Emu 1.0
import QtQuick.Controls 1.3

Rectangle {
    id: rectangle1
    width: 320
    height: 480
    color: "#AAA"

    ColumnLayout {
        id: sidebar
        width: parent.width*0.15
        anchors.bottom: controls.top
        anchors.bottomMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.left: screen.right
        anchors.leftMargin: 0

        ToolButton {
            id: restartButton
            anchors.horizontalCenter: parent.horizontalCenter

            Image {
                fillMode: Image.PreserveAspectFit
                anchors.fill: parent
                anchors.margins: parent.width/10
                source: "qrc:/icons/resources/icons/edit-bomb.png"
            }

            onClicked: Emu.restart();
        }

        ToolButton {
            id: resetButton
            anchors.horizontalCenter: parent.horizontalCenter

            Image {
                fillMode: Image.PreserveAspectFit
                source: "qrc:/icons/resources/icons/system-reboot.png"
                anchors.margins: parent.width/10
                anchors.fill: parent
            }

            onClicked: Emu.reset();
        }

        ToolButton {
            id: pauseButton
            anchors.horizontalCenter: parent.horizontalCenter

            checkable: true

            Image {
                fillMode: Image.PreserveAspectFit
                source: "qrc:/icons/resources/icons/media-playback-pause.png"
                anchors.margins: parent.width/10
                anchors.fill: parent
            }

            onCheckedChanged: Emu.setPaused(checked);
        }
    }

    Screen {
        id: screen
        y: 0
        width: parent.width - sidebar.width
        height: width/320*240
        anchors.left: parent.left
        anchors.leftMargin: 0

        Timer {
            interval: 20
            running: true; repeat: true
            onTriggered: screen.update()
        }
    }

    Flickable {
        id: controls
        boundsBehavior: Flickable.StopAtBounds
        flickableDirection: Flickable.HorizontalAndVerticalFlick
        contentWidth: width
        contentHeight: control1.height*control1.scale
        clip: true
        anchors.top: screen.bottom
        anchors.topMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0

        Keypad {
            id: control1
            // This is to make it possible to use fixed sizes
            scale: controls.width/width
            anchors.centerIn: parent
        }
    }

}

