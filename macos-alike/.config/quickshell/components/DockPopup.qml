import QtQuick
import QtQuick.Controls
import QtQuick.Shapes

Popup {
    id: root

    property string text: ""
    property Item source: null

    function show(t, s) {
        text = t;
        source = s;
        open();
    }

    function hide() {
        close();
        text = "";
        source = null;
    }

    visible: false

    x: source ? source.mapToGlobal(0, 0).x + source.width / 2 - width / 2 : 0
    y: source ? source.mapToGlobal(0, 0).y - height - 40 : 0

    background: Rectangle {
        id: bg

        color: "#101010"
        border.color: "#5c5d61"
        radius: 12

        Shape {
            width: 20
            height: 10
            scale: 1.5

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: -11

            Shape {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: -1.37
                z: -1

                // Fill
                ShapePath {
                    strokeWidth: 0
                    fillColor: "#101010"

                    startX: 0
                    startY: 0
                    PathLine {
                        x: 20
                        y: 0
                    }
                    PathLine {
                        x: 10
                        y: 10
                    }
                    PathLine {
                        x: 0
                        y: 0
                    }
                }

                // Left border
                ShapePath {
                    fillColor: "transparent"
                    strokeColor: "#5c5d61"
                    strokeWidth: 1

                    startX: 0
                    startY: 0
                    PathLine {
                        x: 10
                        y: 10
                    }
                }

                // Right border
                ShapePath {
                    fillColor: "transparent"
                    strokeColor: "#5c5d61"
                    strokeWidth: 1

                    startX: 10
                    startY: 10
                    PathLine {
                        x: 20
                        y: 0
                    }
                }
            }
        }
    }

    contentItem: CustomText {
        text: root.text
        color: "white"
        padding: 3
    }
}
