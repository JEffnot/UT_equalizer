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
    property alias sink_list: sink_list

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
                  
                    
            

            Label{
                        id: lbl_select_output
                        Layout.fillWidth: true
                        text: "Select Audio-Output: "
                    }

            ComboBox {
                        id: combo_output
                        enabled: true
                        currentIndex: 0
                        Layout.fillWidth: true

                        model: ListModel {
                        id: sink_list
                        }
                        onActivated: (index) => {
                             //print(textAt(index)) 
                             python.call("example.set_output", [textAt(index)], function () {
                            })
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

    }

}
