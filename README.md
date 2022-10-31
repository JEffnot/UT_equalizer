# Stereo Equalizer (Alpha)

Fixed 10 Band Equalizer with constant-Q-second order filter.


<img src="https://user-images.githubusercontent.com/113721750/198720815-00ec550c-52eb-4a31-a439-0f080c66ce49.png" width="400">


## How to install

1. Clone respository
2. go into cloned directory
3. run "clickable"
4. run "clickable install"
5. open app first time (audio-plugin-path will be set)
6. reboot phone
7. app can be used now


## Development State

This app is still under development, more features will be included step by step.

Working Features:
- EQ on/off
- Flat EQ
- Boost or cut frequencies by +/- 20dB

Known Issues:
- item placement of buttons and sliders struggle with different display resolutions
- landscape mode is bad, screen is not scrollable
- if you switch on eq there is a slight volume increase


## TODO

- full working Layout vertical/horizontal (scaling to all devices)
- Ubuntu Touch Theme
- Select Audio Output source
- Select/Save Profiles
- Select Neutral Sound Profiles (Headphone)
- Add L/R Balance
- Add Crossfeed for Headphone
- Add VU-Meter

## How can you support/help?

Please feel free to install this app and report any bugs or errors. If you wish a new feature or have a comment to the app leave also a message here.
I run and develop this app on a Xiaomi Mi A2, so feedback from other device owners are very welcome. (screen fitting, sound glitches...)

## App permissions!

This app uses python as backend, mostly for subprocess calls. It uses command line interface to control the audio-plugin.
When you start the app for the first time, the app needs to set the path to the audio-plugin and you have to reboot.
After your phone is booted up again, you can use the app and tweak the sound you like.

In terms of the use of command line interface and exporting the audio-plugin-path, the app needs to be marked as "unconfined".



## Cudos

Thanks Tim for your wonderful audio plugin! (http://quitte.de/dsp/caps.html)


## License

Copyright (C) 2022  Jeffnot

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License version 3, as published
by the Free Software Foundation.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranties of MERCHANTABILITY, SATISFACTORY QUALITY, or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program.  If not, see <http://www.gnu.org/licenses/>.
