import QtQuick 2.7
import Ubuntu.Components 1.3
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.2
import Qt.labs.settings 1.0
import io.thp.pyotherside 1.4


Rectangle {
    width: root.width
    height: root.height
    //color: "green"

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
            Layout.fillWidth: true
            Layout.preferredWidth: root.width * 0.96
            Layout.preferredHeight: root.height
            spacing: root.height * 0.02

            RowLayout{
                id: panel_preset
                Layout.fillWidth: true

                Label{
                    id: lbl_select_preset
                    Layout.fillWidth: true
                    text: "Select EQ-Preset:    "
                }
                ComboBox {
                    id: combo_preset
                    Layout.fillWidth: true
                    model: ListModel {
                        ListElement { text: "Flat" }
                        ListElement { text: "Custom" }
                        ListElement { text: "Bass Boost" }
                    }
                onActivated: (index) => { print(textAt(index)) }
                }     
            }

            RowLayout{
                id: panel_eq_slider
                Layout.fillWidth: true
                Layout.maximumWidth: parent.width

                ColumnLayout{
                    id: slider_display_31
                    spacing : 0
                    Layout.fillWidth: true

                    Text{
                        id: lbl_31dB
                        text: "0"
                        font.bold: false
                        font.pointSize: dbhz_text_size
                        Layout.margins : dbhz_display_margin
                    }

                    Slider {
                        id: slider_31
                        enabled: slider_enabled
                        from: min_dB
                        to: max_dB
                        stepSize: slider_step
                        value: 0.0
                        live: fale // true
                        snapMode: slider_snapMode
                        orientation: Qt.Vertical
                        onMoved: {
                            lbl_31dB.text=value
                            python.call("example.get_slider_31", [value], function () {
                            })
                        }   
                    }

                    Text{
                        id: lbl_31Hz
                        text: "31"
                        font.bold: false
                        font.pointSize: dbhz_text_size
                        Layout.margins : dbhz_display_margin
                    }
                }

                ColumnLayout{
                    id: slider_display_62
                    spacing : 0
                    Layout.fillWidth: true

                    Text{
                        id: lbl_62dB
                        text: "0"
                        font.bold: false
                        font.pointSize: dbhz_text_size
                        Layout.margins : dbhz_display_margin
                    }


                    Slider {
                        id: slider_62
                        enabled: slider_enabled
                        from: min_dB
                        to: max_dB
                        stepSize: slider_step
                        value: 0.0
                        live: true
                        snapMode: slider_snapMode
                        orientation: Qt.Vertical
                        onMoved: {
                            lbl_62dB.text=value
                            python.call("example.get_slider_62", [value], function () {
                            })
                        }
                    }

                    Text{
                        id: lbl_62Hz
                        text: "62"
                        font.bold: false
                        font.pointSize: dbhz_text_size
                        Layout.margins : dbhz_display_margin
                    }
                }

                ColumnLayout{
                    id: slider_display_125
                    spacing : 0
                    Layout.fillWidth: true

                    Text{
                        id: lbl_125dB
                        text: "0"
                        font.bold: false
                        font.pointSize: dbhz_text_size
                        Layout.margins : dbhz_display_margin
                    }

                    Slider {
                        id: slider_125
                        enabled: slider_enabled
                        from: min_dB
                        to: max_dB
                        stepSize: slider_step
                        value: 0.0
                        live: true
                        snapMode: slider_snapMode
                        orientation: Qt.Vertical
                        onMoved: {
                            lbl_125dB.text=value
                            python.call("example.get_slider_125", [value], function () {
                            })
                        }
                    }

                    Text{
                        id: lbl_125Hz
                        text: "125"
                        font.bold: false
                        font.pointSize: dbhz_text_size
                        Layout.margins : dbhz_display_margin
                    }
                }

                ColumnLayout{
                    id: slider_display_250
                    spacing : 0
                    Layout.fillWidth: true

                    Text{
                        id: lbl_250dB
                        text: "0"
                        font.bold: false
                        font.pointSize: dbhz_text_size
                        Layout.margins : dbhz_display_margin
                    }


                    Slider {
                        id: slider_250
                        enabled: slider_enabled
                        from: min_dB
                        to: max_dB
                        stepSize: slider_step
                        value: 0.0
                        live: true
                        snapMode: slider_snapMode
                        orientation: Qt.Vertical
                        onMoved: {
                            lbl_250dB.text=value
                            python.call("example.get_slider_250", [value], function () {
                            })
                        }
                    }

                    Text{
                        id: lbl_250Hz
                        text: "250"
                        font.bold: false
                        font.pointSize: dbhz_text_size
                        Layout.margins : dbhz_display_margin
                    }
                }


                ColumnLayout{
                    id: slider_display_500
                    spacing : 0
                    Layout.fillWidth: true

                    Text{
                        id: lbl_500dB
                        text: "0"
                        font.bold: false
                        font.pointSize: dbhz_text_size
                        Layout.margins : dbhz_display_margin
                    }

                    Slider {
                        id: slider_500
                        enabled: slider_enabled
                        from: min_dB
                        to: max_dB
                        stepSize: slider_step
                        value: 0.0
                        live: true
                        snapMode: slider_snapMode
                        orientation: Qt.Vertical
                        onMoved: {
                            lbl_500dB.text=value
                            python.call("example.get_slider_500", [value], function () {
                            })
                        }
                    }
                    Text{
                        id: lbl_500Hz
                        text: "500"
                        font.bold: false
                        font.pointSize: dbhz_text_size
                        Layout.margins : dbhz_display_margin
                    }
                }


                ColumnLayout{
                    id: slider_display_1k
                    spacing : 0
                    Layout.fillWidth: true

                    Text{
                        id: lbl_1kdB
                        text: "0"
                        font.bold: false
                        font.pointSize: dbhz_text_size
                        Layout.margins : dbhz_display_margin
                    }


                    Slider {
                        id: slider_1k
                        enabled: slider_enabled
                        from: min_dB
                        to: max_dB
                        stepSize: slider_step
                        value: 0.0
                        live: true
                        snapMode: slider_snapMode
                        orientation: Qt.Vertical
                        onMoved: {
                            lbl_1kdB.text=value
                            python.call("example.get_slider_1k", [value], function () {
                            })
                        }
                    }

                    Text{
                        id: lbl_1kz
                        text: "1k"
                        font.bold: false
                        font.pointSize: dbhz_text_size
                        Layout.margins : dbhz_display_margin
                    }
                }

                ColumnLayout{
                    id: slider_display_2k
                    spacing : 0
                    Layout.fillWidth: true

                    Text{
                        id: lbl_2kdB
                        text: "0"
                        font.bold: false
                        font.pointSize: dbhz_text_size
                        Layout.margins : dbhz_display_margin
                    }

                    Slider {
                        id: slider_2k
                        enabled: slider_enabled
                        from: min_dB
                        to: max_dB
                        stepSize: slider_step
                        value: 0.0
                        live: true
                        snapMode: slider_snapMode
                        orientation: Qt.Vertical
                        onMoved: {
                            lbl_2kdB.text=value
                            python.call("example.get_slider_2k", [value], function () {
                            })
                        }
                    }

                    Text{
                        id: lbl_2kz
                        text: "2k"
                        font.bold: false
                        font.pointSize: dbhz_text_size
                        Layout.margins : dbhz_display_margin
                    }
                }

                ColumnLayout{
                    id: slider_display_4k
                    spacing : 0
                    Layout.fillWidth: true

                    Text{
                        id: lbl_4kdB
                        text: "0"
                        font.bold: false
                        font.pointSize: dbhz_text_size
                        Layout.margins : dbhz_display_margin
                    }

                    Slider {
                        id: slider_4k
                        enabled: slider_enabled
                        from: min_dB
                        to: max_dB
                        stepSize: slider_step
                        value: 0.0
                        live: true
                        snapMode: slider_snapMode
                        orientation: Qt.Vertical
                        onMoved: {
                            lbl_4kdB.text=value
                            python.call("example.get_slider_4k", [value], function () {
                            })
                        }
                    }

                    Text{
                        id: lbl_4kz
                        text: "4k"
                        font.bold: false
                        font.pointSize: dbhz_text_size
                        Layout.margins : dbhz_display_margin
                    }
                }

                ColumnLayout{
                    id: slider_display_8k
                    spacing : 0
                    Layout.fillWidth: true

                    Text{
                        id: lbl_8kdB
                        text: "0"
                        font.bold: false
                        font.pointSize: dbhz_text_size
                        Layout.margins : dbhz_display_margin
                    }

                    Slider {
                        id: slider_8k
                        enabled: slider_enabled
                        from: min_dB
                        to: max_dB
                        stepSize: slider_step
                        value: 0.0
                        live: true
                        snapMode: slider_snapMode
                        orientation: Qt.Vertical
                        onMoved: {
                            lbl_8kdB.text=value
                            python.call("example.get_slider_8k", [value], function () {
                            })
                        }
                    }

                    Text{
                        id: lbl_8kz
                        text: "8k"
                        font.bold: false
                        font.pointSize: dbhz_text_size
                        Layout.margins : dbhz_display_margin
                    }
                }

                ColumnLayout{
                    id: slider_display_16k
                    spacing : 0
                    Layout.fillWidth: true

                    Text{
                        id: lbl_16kdB
                        text: "0"
                        font.bold: false
                        font.pointSize: dbhz_text_size
                        Layout.margins : dbhz_display_margin
                    }
                    Slider {
                        id: slider_16k
                        enabled: slider_enabled
                        from: min_dB
                        to: max_dB
                        stepSize: slider_step
                        value: 0.0
                        live: true
                        snapMode: slider_snapMode
                        orientation: Qt.Vertical
                        onMoved: {
                            lbl_16kdB.text=value
                            python.call("example.get_slider_16k", [value], function () {
                            })
                        }
                    }

                    Text{
                        id: lbl_16kz
                        text: "16k"
                        font.bold: false
                        font.pointSize: dbhz_text_size
                        Layout.margins : dbhz_display_margin
                    }
                }
            }

            Button {
                id: btn_reset_fader
                Layout.fillWidth: true
                text: "Reset Fader to 0dB"
                onClicked: {
                    print("EQ flat")
                    slider_31.value = 0
                    slider_62.value = 0
                    slider_125.value = 0
                    slider_250.value = 0
                    slider_500.value = 0
                    slider_1k.value = 0
                    slider_2k.value = 0
                    slider_4k.value = 0
                    slider_8k.value = 0
                    slider_16k.value = 0
                    lbl_31dB.text=0
                    lbl_62dB.text=0
                    lbl_125dB.text=0
                    lbl_250dB.text=0
                    lbl_500dB.text=0
                    lbl_1kdB.text=0
                    lbl_2kdB.text=0
                    lbl_4kdB.text=0
                    lbl_8kdB.text=0
                    lbl_16kdB.text=0
                    python.call("example.flat_eq", [], function () {
                    })
                }
            }

            RowLayout {
                id: panel_eq_on_off

                Button {
                    id: btn_eq_on
                    text: "EQ on"
                    enabled: true
                    Layout.fillWidth: true
                    //Layout.maximumWidth: parent.width
                    onClicked: {
                        print("EQ on")
                        btn_eq_off.enabled=true
                        btn_eq_on.enabled=false
                        //combo_output.enabled=false
                        python.call("example.set_eq_on", [], function () {
                        })
                    }
                }
                Button {
                    id: btn_eq_off
                    text: "EQ off"
                    enabled: false
                    Layout.fillWidth: true
                    //Layout.maximumWidth: parent.width
                    onClicked: {
                        print("EQ off")
                        btn_eq_on.enabled=true
                        btn_eq_off.enabled=false
                        //combo_output.enabled=true
                        python.call("example.set_eq_off", [], function () {
                        })
                    }
                }
            }

            Item {
                id: spacer_eq_btn_on_off
                height: root.height * 0.05
            } // Spacer
            
        } // Main Column end

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



    
