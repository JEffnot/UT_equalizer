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
            Layout.fillWidth: true
            Layout.preferredWidth: root.width * 0.96
            Layout.preferredHeight: root.height


            Text{
                text: "Release <b>Alpha</b>"
                }

            Text{
                width: root.width * 0.96
                wrapMode: text.WordWrap
                //text: "EQ will set your sound output fixed to speaker. \nOutput source selection is not implemented yet.  \nEQ Preset not implemented yet. \nBalancing not implemented yet."
                text: "EQ will set your sound output fixed to speaker. Output source selection is not implemented yet. EQ Preset not implemented yet. Balancing not implemented yet."
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
