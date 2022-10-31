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


                RowLayout{
                    id: panel_output
                    //Layout.preferredWidth: root.width * 0.96
                    //Layout.preferredHeight: root.height
                    
                    Label{
                        id: lbl_select_output
                        Layout.fillWidth: true
                        text: "Select Audio-Output: "
                        fontSizeMode: Text.Fit
                    }
                    ComboBox {
                        id: combo_output
                        enabled: true
                        Layout.fillWidth: true
                        model: ListModel {
                            ListElement { text: "Speaker" }
                            ListElement { text: "Heaphone Jack" }
                            ListElement { text: "USB DAC" }
                        }
                    onActivated: (index) => { print(textAt(index)) }
                    }     
                }

                Text{
                    id: root_width_size
                    text: "Screenwidth: " + root.width + " px"
                }
                Text{
                    id: root_height_size
                    text: "Screenheight: " + root.height + " px"
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
