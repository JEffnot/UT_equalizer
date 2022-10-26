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

command = ""

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


module_number = ""


def eq_on():
  output = subprocess.getoutput('export LADSPA_PATH=/opt/click.ubuntu.com/.click/users/phablet/equalizer.jeffnot/lib')
  pyotherside.send('debug-info', "LADSPA_PATH variable exported")

  module_number = subprocess.getoutput('pactl load-module module-ladspa-sink sink_name=ladspa_out master=sink.primary_output plugin=caps label=Eq10X2 control=0,0,0,0,0,6,0,0,0,0')
  pyotherside.send('debug-info', 'Ladspa Plugin caps.so loaded with number '+module_number)


def eq_off():
  module_number = ""
  output = subprocess.getoutput('pactl unload-module module-ladspa-sink')
  pyotherside.send('debug-info', 'pulseaudio plugins with name -module-ladspa-sink unloadeded')



def flat_eq():
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
  print_slider_values()

def get_slider_31(slider_31):
  slider_values['Hz31'] = str(slider_31)
  print_slider_values()

def get_slider_62(slider_62):
  slider_values['Hz62'] = str(slider_62)
  print_slider_values()

def get_slider_125(slider_125):
  slider_values['Hz125'] = str(slider_125)
  print_slider_values()

def get_slider_250(slider_250):
  slider_values['Hz250'] = str(slider_250)
  print_slider_values()

def get_slider_500(slider_500):
  slider_values['Hz500'] = str(slider_500)
  print_slider_values()

def get_slider_1k(slider_1k):
  slider_values['Hz1k'] = str(slider_1k)
  print_slider_values()

def get_slider_2k(slider_2k):
  slider_values['Hz2k'] = str(slider_2k)
  print_slider_values()

def get_slider_4k(slider_4k):
  slider_values['Hz4k'] = str(slider_4k)
  print_slider_values()

def get_slider_8k(slider_8k):
  slider_values['Hz8k'] = str(slider_8k)
  print_slider_values()

def get_slider_16k(slider_16k):
  slider_values['Hz16k'] = str(slider_16k)
  print_slider_values()




def print_slider_values():
  command = slider_values['Hz31']+ \
    ','+slider_values['Hz62']+ \
      ','+slider_values['Hz125']+\
        ','+slider_values['Hz250']+\
          ','+slider_values['Hz500']+\
            ','+slider_values['Hz1k']+\
              ','+slider_values['Hz2k']+\
                ','+slider_values['Hz4k']+\
                  '.'+slider_values['Hz8k']+\
                    ','+slider_values['Hz16k']
  pyotherside.send('debug-info', command)

