# Stereo Equalizer (Demo)

Fixed 10 Band Equalizer with constant-Q-second order filter.
It is my first mobil app ever, so please be patient :)

# Current Development State

This app is still under development.

Working Features:
- EQ on/off
- Flat EQ
- Boost or cut frequencies by +/- 20dB

# TODOs

- Layout vertical/horizontal
- Ubuntu Touch Theme
- Select Audio Output source
- Select/Save Custom Profiles
- Select Neutral Sound Profiles (Headphone)
- Add L/R Balance
- Add Crossfeed for Headphone

# Security

This app uses python as backend. It uses command line interface to control the equalizer plugin.
When you start the app for the first time, you have to reboot your device to use the app.
The app needs to export a variable with the path to the equalizer plugin. This is done at the first start.
After that you can use the app.

In terms of the use of command line and exporting variables the app needs to be "unconfined".

## License

Copyright (C) 2022  Jeffnot

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License version 3, as published
by the Free Software Foundation.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranties of MERCHANTABILITY, SATISFACTORY QUALITY, or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program.  If not, see <http://www.gnu.org/licenses/>.
