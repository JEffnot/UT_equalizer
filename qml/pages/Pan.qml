import QtQuick 2.7
import Ubuntu.Components 1.3
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.2
import Qt.labs.settings 1.0
import io.thp.pyotherside 1.4
    

Rectangle {
    width: root.width
    height: root.height
    //color: "red"

    RowLayout
    {
        ColumnLayout{
            id: left_border

            Rectangle {
            Layout.preferredWidth: root.width * 0.02
            Layout.preferredHeight: root.height
            //color: "grey"
            }
        }


        ColumnLayout{
            id: main_column
            Layout.preferredWidth: root.width * 0.96
            Layout.preferredHeight: root.height
            spacing : root.height*0.02

            RowLayout{
                Text{
                    id: lbl_pan
                    text: "Balance L/R"
                    Layout.fillWidth: true
                }
                Text{
                    id: lbl_pan_value
                    text: "0"
                    Layout.fillWidth: true
                }

            }
            

            Dial {
                id: pan_controller
                Layout.fillWidth: true
                from: -10
                to: 10
                stepSize: 1
                snapMode: Dial.SnapAlways
                value: 0
                live: true
                Keys.onLeftPressed: {}
                onMoved: {
                        lbl_pan_value.text = value
                }
            }       
        }

        ColumnLayout{
            id: right_border

            Rectangle {
            Layout.preferredWidth: root.width * 0.02
            Layout.preferredHeight: root.height
            //color: "grey"
            }
        }
    } // end main row
} // end rectangle