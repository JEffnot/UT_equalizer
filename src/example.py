'''
 Copyright (C) 2022  Jeffnot

 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation; version 3.

 equalizer is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
  along with this program.  If not, see <http://www.gnu.org/licenses/>.
'''
import pyotherside
import subprocess


# Global variables
export_path_string = "export LADSPA_PATH=/opt/click.ubuntu.com/.click/users/phablet/equalizer.jeffnot/lib"

eq_state = "off"
control = "0,0,0,0,0,0,0,0,0,0"
volume_offset = "13" # percentage > + when on, - when off

slider_values = dict(
  Hz31='0.0',
  Hz62='0.0',
  Hz125='0.0',
  Hz250='0.0',
  Hz500='0.0',
  Hz1k='0.0',
  Hz2k='0.0',
  Hz4k='0.0',
  Hz8k='0.0',
  Hz16k='0.0'
  )

active_module = ""
inactive_module = ""

device_list = []


def get_devices():
  global device_list

  pyotherside.send('debug-info', "Start Application")

  output = subprocess.getoutput('pactl list sinks short')

  audio_interfaces = output.splitlines()
    #audio_interfaces = []

  for i in audio_interfaces:
            #j= i.strip() # delete spaces
            j= i.split() # split on any whitespace
            device_list.append({'sink_nr': str(j[0]), 'sink_name': str(j[1]), 'sink_lib': str(j[2]), 'sink_bitrate': str(j[3]), 'sink_samplerate': str(j[4]), 'sink_state': str(j[6])})
  
  #pyotherside.send('debug-info', device_list)  


  # This is just to get sure, the dictionary is working
  device_list= [
        {'sink_name': 'Alpha', 'team': 'red'},
        {'sink_name': 'Beta', 'team': 'blue'},
        {'sink_name': 'Gamma', 'team': 'green'},
        {'sink_name': 'Delta', 'team': 'yellow'},
        {'sink_name': 'Epsilon', 'team': 'orange'},
    ]
  
  #pyotherside.send('debug-info', device_list)  

  return device_list


def check_ladspa_path():
  global export_path_string
  output = subprocess.getoutput('grep -Fx \"'+export_path_string+'\" /home/phablet/.profile')
  
  if output == export_path_string:
    pyotherside.send('debug-info', 'Audio Plugin Path found: '+output)
    pyotherside.send('plugin_path_ok')
  else:
    pyotherside.send('debug-info', 'Audio Plugin Path not found')
    export_plugin_path()


def export_plugin_path():
  global export_path_string
  output = subprocess.getoutput('echo \"'+export_path_string+'\" >> /home/phablet/.profile')
  pyotherside.send('debug-info', 'Audio Plugin Path added to .config')
  pyotherside.send('debug-info', 'Please reboot your phone to take effect.')
  #notify QML Handler
  pyotherside.send('no_plugin_path')
  

def set_eq_on():
  global slider_values
  global active_module
  global new_module_number
  global eq_state
  global control


  output = subprocess.getoutput('pactl -- set-sink-volume 0 -'+volume_offset+'%') # decrease volume, because ther is a slight volume increase when eq on
  active_module = subprocess.getoutput('pactl load-module module-ladspa-sink sink_name=equalizer master=sink.primary_output plugin=caps label=Eq10X2 control='+control)
  #pyotherside.send('debug-info', 'EQ ON: Ladspa Plugin caps.so loaded with number '+active_module)
  eq_state = "on"
    

def set_eq_off():
  global active_module
  global inactive_module
  global eq_state

  if (active_module != ""):
    #output = subprocess.getoutput('pactl unload-module module-ladspa-sink')
    output = subprocess.getoutput('pactl unload-module '+active_module)
    output = subprocess.getoutput('pactl -- set-sink-volume 0 +'+volume_offset+'%') # decrease volume, because ther is a slight volume increase when eq on
    #pyotherside.send('debug-info', 'EQ OFF: pulseaudio plugins with name -module-ladspa-sink unloadeded')

  active_module = ""
  eq_state = "off"


def flat_eq():
  global slider_values

  slider_values['Hz31'] = '0.0'
  slider_values['Hz62'] = '0.0'
  slider_values['Hz125'] = '0.0'
  slider_values['Hz250'] = '0.0'
  slider_values['Hz500'] = '0.0'
  slider_values['Hz1k'] = '0.0'
  slider_values['Hz2k'] = '0.0'
  slider_values['Hz4k'] = '0.0'
  slider_values['Hz8k'] = '0.0'
  slider_values['Hz16k'] = '0.0'
  set_eq()


def get_slider_31(slider_31):
  slider_values['Hz31'] = str(slider_31)
  set_eq()


def get_slider_62(slider_62):
  slider_values['Hz62'] = str(slider_62)
  set_eq()


def get_slider_125(slider_125):
  slider_values['Hz125'] = str(slider_125)
  set_eq()


def get_slider_250(slider_250):
  slider_values['Hz250'] = str(slider_250)
  set_eq()


def get_slider_500(slider_500):
  slider_values['Hz500'] = str(slider_500)
  set_eq()


def get_slider_1k(slider_1k):
  slider_values['Hz1k'] = str(slider_1k)
  set_eq()


def get_slider_2k(slider_2k):
  slider_values['Hz2k'] = str(slider_2k)
  set_eq()


def get_slider_4k(slider_4k):
  slider_values['Hz4k'] = str(slider_4k)
  set_eq()


def get_slider_8k(slider_8k):
  slider_values['Hz8k'] = str(slider_8k)
  set_eq()


def get_slider_16k(slider_16k):
  slider_values['Hz16k'] = str(slider_16k)
  set_eq()


def set_eq():

  global active_module
  global inactive_module
  global control

  control = slider_values['Hz31']+ \
    ','+slider_values['Hz62']+ \
      ','+slider_values['Hz125']+\
        ','+slider_values['Hz250']+\
          ','+slider_values['Hz500']+\
            ','+slider_values['Hz1k']+\
              ','+slider_values['Hz2k']+\
                ','+slider_values['Hz4k']+\
                  ','+slider_values['Hz8k']+\
                    ','+slider_values['Hz16k']

  #pyotherside.send('debug-info', control)

  if eq_state == "on":
    # load new eq modul with new settings
    new_module_number = subprocess.getoutput('pactl load-module module-ladspa-sink sink_name=ladspa_out master=sink.primary_output plugin=caps label=Eq10X2 control='+control)
    #pyotherside.send('debug-info', 'EQ update: loaded with number '+new_module_number)
    # delete old module
    output = subprocess.getoutput('pactl unload-module '+active_module)
    #pyotherside.send('debug-info', 'Ladspa module unloaded with number '+active_module+ ' '+ output)
    active_module = new_module_number




