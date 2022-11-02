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
import Ubuntu.Components 1.3
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.2
import Qt.labs.settings 1.0
import io.thp.pyotherside 1.4
import "pages" as Page

MainView {
    id: root
    objectName: 'mainView'
    applicationName: 'equalizer.jeffnot'
    automaticOrientation: true

    property var main_column_margin: 0
    property var height_space_items: 10
    property var dbhz_display_margin: 0
    property var dbhz_text_size: 10
    property var slider_enabled: true
    property var max_dB: 15
    property var min_dB: -15
    property var slider_step: 3 // dB
    //property string Slider.SnapAlways: Slider.SnapAlways//SnapOnRelease
    property bool slider_liveMode: true
    property var slider_offset: 0
    property var sink_list: []
    
    SwipeView {
        id: view
        currentIndex: 0
        anchors.fill: parent

        Item {
            id: page_Startpage
            clip:true
            Page.Startpage {
                sink_list : root.sink_list
            }
        }

        Item {
            id: page_Config
            clip:true
            Page.Config {}
        }
        Item {
            id: page_Equalizer
            clip: true
            Page.Equalizer {}
        }
        Item {
            id: page_Pan
            clip:true
            Page.Pan {}
        }
    }

    RowLayout{
                id: panel_no_plugin_path
                spacing: height_space_items
                    Text{
                        id: lbl_no_plugin_path
                        color: "red"
                        visible: false
                        Layout.fillWidth: true
                        wrapMode: Text.WordWrap
                        text: "This is the first time you start this app.\n The equalizer-plugin-path has just been set. \n Please reboot your device, so that you can use the app."
                    }
            }  

    PageIndicator {
        id: indicator

        count: view.count
        currentIndex: view.currentIndex

        anchors.bottom: view.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }




    Python {
        id: python

        Component.onCompleted: {
            addImportPath(Qt.resolvedUrl('../src/'));

            importModule('example', function() {
                console.log('python modul imported');

                python.call("example.check_ladspa_path", [], function () {
                })

                python.call('example.get_devices', [], function(result) {
                    // Load the received data into the list model
                    for (var i=0; i<result.length; i++) {
                        console.log(result[i]);
                        root.sink_list.append(result[i]);
                    }
                });
            });

            setHandler('plugin_path_ok', function() {
                lbl_no_plugin_path.visible=false;
            });

            setHandler('no_plugin_path', function() {
                lbl_no_plugin_path.visible=true;
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
