import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    id: window
    visible: true
    width: 360
    height: 640
    title: "श्री हित चौरासी जी"

    // Spiritual Dark Theme Colors
    property color primaryColor: "#800000"
    property color goldColor: "#FFD700"
    property color bgDark: "#1A0505"

    Rectangle {
        anchors.fill: parent
        color: window.bgDark

        // Animated Glowing Background
        Rectangle {
            id: glowBg
            width: 250
            height: 250
            radius: 125
            color: window.goldColor
            opacity: 0.12
            anchors.centerIn: parent

            SequentialAnimation on scale {
                loops: Animation.Infinite
                PropertyAnimation { to: 1.4; duration: 2500; easing.type: Easing.InOutQuad }
                PropertyAnimation { to: 1.0; duration: 2500; easing.type: Easing.InOutQuad }
            }
        }

        // Main Header
        Rectangle {
            id: header
            width: parent.width
            height: 60
            color: window.primaryColor
            z: 2

            Text {
                anchors.centerIn: parent
                text: "॥ श्री हित चौरासी ॥"
                color: window.goldColor
                font.pixelSize: 22
                font.bold: true
            }
        }

        // Offline JSON Model Loader
        ListModel {
            id: padModel
        }

        Component.onCompleted: {
            var request = new XMLHttpRequest();
            request.open("GET", "qrc:/qt/qml/ChaurasiPad/assets/chaurasi_pad.json", true);
            request.onreadystatechange = function() {
                if (request.readyState === XMLHttpRequest.DONE) {
                    var array = JSON.parse(request.responseText);
                    for (var i = 0; i < array.length; i++) {
                        padModel.append(array[i]);
                    }
                }
            }
            request.send();
        }

        // Scrollable List of Pads
        ListView {
            anchors.top: header.bottom
            anchors.bottom: parent.bottom
            width: parent.width
            model: padModel
            clip: true
            spacing: 15

            delegate: Rectangle {
                width: parent.width - 30
                height: padText.implicitHeight + titleText.implicitHeight + 40
                anchors.horizontalCenter: parent.horizontalCenter
                color: "#2A0A0A"
                radius: 12
                border.color: "#4A1515"
                border.width: 1

                Column {
                    anchors.fill: parent
                    anchors.margins: 15
                    spacing: 10

                    Text {
                        id: titleText
                        text: model.title
                        color: window.goldColor
                        font.pixelSize: 18
                        font.bold: true
                        width: parent.width
                        horizontalAlignment: Text.AlignHCenter
                    }

                    Rectangle {
                        width: parent.width * 0.8
                        height: 1
                        color: window.goldColor
                        opacity: 0.3
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    Text {
                        id: padText
                        text: model.content
                        color: "#FFFFFF"
                        font.pixelSize: 16
                        wrapMode: Text.WordWrap
                        width: parent.width
                        horizontalAlignment: Text.AlignHCenter
                        lineHeight: 1.3
                    }
                }
            }
        }
    }
}
