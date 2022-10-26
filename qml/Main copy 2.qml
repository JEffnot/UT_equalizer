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

    property var main_column_margin: 13
    property var height_space_items: 100

    //width: units.gu(45)
    //height: units.gu(75)
    //width: parent.width
    //height: parent.height

    Page {

        //anchors.fill: parent
        //width: parent.width

        header: PageHeader {
            id: panel_header
            title: i18n.tr('Equalizer - Stereo 10x fixed')
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

            Button {
                id: button_2
                //width: parent.width
                Layout.fillWidth: true
                Layout.margins : main_column_margin
                //iconName: "compose"
                text: "Flat EQ"
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
                    python.call("example.flat_eq", [], function () {
                        })

                }
            }

            Item {
                id: spacer_3
                height: height_space_items
            } // Spacer

            // ChartView {
            //     id: chart
            //     title: "Spline"
            //     anchors{
            //         top: spacer_3.bottom
            //     }
            //     antialiasing: true

            //     SplineSeries {
            //         name: "SplineSeries"
            //         XYPoint { x: 0; y: 0.0 }
            //         XYPoint { x: 1.1; y: 3.2 }
            //         XYPoint { x: 1.9; y: 2.4 }
            //         XYPoint { x: 2.1; y: 2.1 }
            //         XYPoint { x: 2.9; y: 2.6 }
            //         XYPoint { x: 3.4; y: 2.3 }
            //         XYPoint { x: 4.1; y: 3.1 }
            //     }
            // }






            RowLayout{
                id: panel_eq_slider
                spacing : 0
                Layout.fillWidth: true
                Layout.margins : main_column_margin
                //width: parent.width
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
                        python.call("example.get_slider_31", [value], function () {
                        })
                    }
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
                        python.call("example.get_slider_62", [value], function () {
                        })
                    }
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
                        python.call("example.get_slider_125", [value], function () {
                        })
                    }
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
                        python.call("example.get_slider_250", [value], function () {
                        })
                    }
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
                        python.call("example.get_slider_500", [value], function () {
                        })
                    }
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
                        python.call("example.get_slider_1k", [value], function () {
                        })
                    }
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
                        python.call("example.get_slider_2k", [value], function () {
                        })
                    }
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
                        python.call("example.get_slider_4k", [value], function () {
                        })
                    }
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
                        python.call("example.get_slider_8k", [value], function () {
                        })
                    }
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
                        python.call("example.get_slider_16k", [value], function () {
                        })
                    }
                }
            }

            Item {
                id: spacer_panel_eq_slider
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
                    }
                }
            }
        } // Main Column end
    } // Page end
        

    Python {
        id: python

        Component.onCompleted: {
            addImportPath(Qt.resolvedUrl('../src/'));

            importModule('example', function() {
                console.log('module imported');
                python.call('example.speak', ['Hello World!'], function(returnValue) {
                    console.log('example.speak returned ' + returnValue);
                })
            });

            setHandler('debug-info', function (text) {
                console.log('debug-info: ' + text);
            });
        }

        onError: {
            console.log('python error: ' + traceback);
        }
    }
}
