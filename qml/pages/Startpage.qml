import QtQuick 2.7
import Ubuntu.Components 1.3
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.2
import Qt.labs.settings 1.0
import io.thp.pyotherside 1.4




Rectangle {
    width: root.width
    height: root.height
    //color: "yellow"

    property var sink_list: []

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
            spacing: root.height * 0.02
            
            Layout.preferredWidth: root.width * 0.96
            Layout.preferredHeight: root.height


            Text{
                text: "Release <b>Alpha</b>"
                }

            Text{
                Layout.fillWidth: true
                wrapMode: Text.WordWrap
                text: "<ul><li>ReleaseEQ will set your sound output fixed to speaker.</li>\
                <li>Output source selection is not implemented yet.</li> \
                <li>EQ Preset not implemented yet. \nBalancing not implemented yet.</li></ul>"
            }

            // ListView {
            //     Layout.fillWidth: true

            //     model: ListModel {
            //         id: sink_list
            //     }
            //     // delegate: Text {
            //     //     // Both "name" and "team" are taken from the model
            //     //     text: sink_name
            //     // }
            // }

            ComboBox {
                id: combo_output
                enabled: true
                Layout.fillWidth: true

                model: ListModel {
                id: sink_list
                }
                //delegate: Text {
                //text: sink_name
                //}
                onActivated: (index) => { print(textAt(index)) }
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
    }
}
