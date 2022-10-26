/*
 * Copyright (C) 2022  Jeffnot
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * equalizer is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.7
//import QtCharts 2.4
import Ubuntu.Components 1.3
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.2
import Qt.labs.settings 1.0
import io.thp.pyotherside 1.4

MainView {
    id: root
    objectName: 'mainView'
    applicationName: 'equalizer.jeffnot'
    automaticOrientation: true

    property var main_column_margin: 0
    property var height_space_items: 100
    property var dbhz_display_margin: 40
    property var dbhz_text_size: 15


    //width: units.gu(45)
    //height: units.gu(75)
    //width: parent.width
    //height: parent.height

    Page {

        //anchors.fill: parent
        //width: parent.width

        header: PageHeader {
            id: panel_header
            title: i18n.tr('Stereo Equalizer')
        }

        ColumnLayout{
            id: main_column
            //anchors.fill: parent
            Layout.fillWidth: true
            spacing : 0
            //width: parent.width

            Item {
                id: spacer_header
                height: height_space_items
            } // Spacer

            RowLayout{
                id: panel_output
                spacing: 5
                //height: 150
                Layout.fillWidth: true
                Layout.margins : main_column_margin
                //width: parent.width

                Label{
                    id: lbl_select_output
                    Layout.fillWidth: true
                    text: "Select Audio-Output: "
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
            


            Item {
                id: spacer_panel_output
                height: height_space_items
            } // Spacer


            RowLayout{
                id: panel_preset
                spacing: 5
                height: 150
                //width: parent.width
                Layout.fillWidth: true
                Layout.margins : main_column_margin

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
                        ListElement { text: "Bass Boost" }
                        ListElement { text: "Mid Boost" }
                    }
                onActivated: (index) => { print(textAt(index)) }
                }     
            }

            Item {
                id: spacer_panel_preset
                height: height_space_items
            } // Spacer


            RowLayout{
                id: panel_eq_slider
                spacing : 0
                Layout.fillWidth: true
                Layout.margins : main_column_margin

                ColumnLayout{
                    id: slider_display_31
                    spacing : 0

                    Text{
                        id: lbl_31dB
                        text: "0"
                        font.bold: false
                        font.pointSize: dbhz_text_size
                        Layout.margins : dbhz_display_margin
                    }

                    Slider {
                        id: slider_31
                        //function formatValue(v64) { return v32.toFixed(2) }
                        from: -15.0
                        to: 15.0
                        stepSize: 1.0
                        value: 0.0
                        live: true
                        snapMode: Slider.SnapAlways
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

                    Text{
                        id: lbl_62dB
                        text: "0"
                        font.bold: false
                        font.pointSize: dbhz_text_size
                        Layout.margins : dbhz_display_margin
                    }


                    Slider {
                        id: slider_62
                        //function formatValue(v64) { return v64.toFixed(2) }
                        from: -15.0
                        to: 15.0
                        stepSize: 1.0
                        value: 0.0
                        live: true
                        snapMode: Slider.SnapAlways
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

                    Text{
                        id: lbl_125dB
                        text: "0"
                        font.bold: false
                        font.pointSize: dbhz_text_size
                        Layout.margins : dbhz_display_margin
                    }


                    Slider {
                        id: slider_125
                        //function formatValue(v64) { return v64.toFixed(2) }
                        from: -15.0
                        to: 15.0
                        stepSize: 1.0
                        value: 0.0
                        live: true
                        snapMode: Slider.SnapAlways
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

                    Text{
                        id: lbl_250dB
                        text: "0"
                        font.bold: false
                        font.pointSize: dbhz_text_size
                        Layout.margins : dbhz_display_margin
                    }


                    Slider {
                        id: slider_250
                        //function formatValue(v64) { return v64.toFixed(2) }
                        from: -15.0
                        to: 15.0
                        stepSize: 1.0
                        value: 0.0
                        live: true
                        snapMode: Slider.SnapAlways
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

                    Text{
                        id: lbl_500dB
                        text: "0"
                        font.bold: false
                        font.pointSize: dbhz_text_size
                        Layout.margins : dbhz_display_margin
                    }

                    Slider {
                        id: slider_500
                        //function formatValue(v64) { return v64.toFixed(2) }
                        from: -15.0
                        to: 15.0
                        stepSize: 1.0
                        value: 0.0
                        live: true
                        snapMode: Slider.SnapAlways
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

                    Text{
                        id: lbl_1kdB
                        text: "0"
                        font.bold: false
                        font.pointSize: dbhz_text_size
                        Layout.margins : dbhz_display_margin
                    }


                    Slider {
                        id: slider_1k
                        //function formatValue(v64) { return v64.toFixed(2) }
                        from: -15.0
                        to: 15.0
                        stepSize: 1.0
                        value: 0.0
                        live: true
                        snapMode: Slider.SnapAlways
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

                    Text{
                        id: lbl_2kdB
                        text: "0"
                        font.bold: false
                        font.pointSize: dbhz_text_size
                        Layout.margins : dbhz_display_margin
                    }


                    Slider {
                        id: slider_2k
                        //function formatValue(v64) { return v64.toFixed(2) }
                        from: -15.0
                        to: 15.0
                        stepSize: 1.0
                        value: 0.0
                        live: true
                        snapMode: Slider.SnapAlways
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

                    Text{
                        id: lbl_4kdB
                        text: "0"
                        font.bold: false
                        font.pointSize: dbhz_text_size
                        Layout.margins : dbhz_display_margin
                    }

                    Slider {
                        id: slider_4k
                        //function formatValue(v64) { return v64.toFixed(2) }
                        from: -15.0
                        to: 15.0
                        stepSize: 1.0
                        value: 0.0
                        live: true
                        snapMode: Slider.SnapAlways
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

                    Text{
                        id: lbl_8kdB
                        text: "0"
                        font.bold: false
                        font.pointSize: dbhz_text_size
                        Layout.margins : dbhz_display_margin
                    }

                    Slider {
                        id: slider_8k
                        //function formatValue(v64) { return v64.toFixed(2) }
                        from: -15.0
                        to: 15.0
                        stepSize: 1.0
                        value: 0.0
                        live: true
                        snapMode: Slider.SnapAlways
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

                    Text{
                        id: lbl_16kdB
                        text: "0"
                        font.bold: false
                        font.pointSize: dbhz_text_size
                        Layout.margins : dbhz_display_margin
                    }
                    Slider {
                        id: slider_16k
                        //function formatValue(v64) { return v64.toFixed(2) }
                        from: -15.0
                        to: 15.0
                        stepSize: 1.0
                        value: 0.0
                        live: true
                        snapMode: Slider.SnapAlways
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

            Item {
                id: spacer_panel_eq_slider
                height: height_space_items
            } // Spacer

            Button {
                id: btn_reset_fader
                //width: parent.width
                Layout.fillWidth: true
                Layout.margins : main_column_margin
                //iconName: "compose"
                text: "Reset Fader to 0dB"
                //iconPosition: "left"
                //height: 150
                //width: 96
                onClicked: {
                    print("Flat EQ")
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

            Item {
                id: spacer_btn_reset_fader
                height: height_space_items
            } // Spacer



            RowLayout {
                id: panel_eq_on_off
                spacing: height_space_items
                Layout.margins : main_column_margin
                //height: 150
                //width: parent.width
                Layout.fillWidth: true
                Button {
                    id: btn_eq_on
                    text: "EQ on"
                    enabled: true
                    //height: 150
                    //Layout.preferredHeight: 150
                    Layout.fillWidth: true
                    //width: 96
                    onClicked: {
                        print("EQ on")
                        btn_eq_off.enabled=true
                        btn_eq_on.enabled=false
                        combo_output.enabled=false
                        python.call("example.eq_on", [], function () {
                        })
                    }
                }
                Button {
                    id: btn_eq_off
                    text: "EQ off"
                    enabled: false
                    //height: 150
                    //Layout.preferredHeight: 150
                    Layout.fillWidth: true
                    //width: 96
                    onClicked: {
                        print("EQ off")
                        btn_eq_on.enabled=true
                        btn_eq_off.enabled=false
                        combo_output.enabled=true
                        python.call("example.eq_on", [], function () {
                        })
                    }
                }
            }
        } // Main Column end
        
    }// Page end
        

    Python {
        id: python

        Component.onCompleted: {
            addImportPath(Qt.resolvedUrl('../src/'));

            importModule('example', function() {
                console.log('module imported');
            });

            setHandler('debug-info', function (text) {
                console.log('debug-info: ' + text);
            });
        }

        onError: {
            console.log('python error: ' + traceback);
        }
    }

} //mainview end
