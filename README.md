teensy-led-alerts
=================

A visual LED alert for splunk, pager duty, sensu and cloudwatch powered by a teensy USB-based microcontroller development system and arduino.

Features
--------
* Lights an LED strip based on alerts
* Support for Pager Duty active incidents
* Support for Splunk alerts
* Support for Sensu Events

I took a short video of a couple of the effects that you can see [here.](https://www.dropbox.com/s/1xmv9pni180laq3/2013-01-27%2021.00.46.mp4)

Stuff you need
--------------
You'll need to make this thing so besides a soldering iron, wire and solder you'll need the following:  
`Teensy 2.0:` http://www.pjrc.com/store/teensy.html  
`LED Strip:` http://www.adafruit.com/products/306  
`LPD8806 Library:` https://github.com/adafruit/LPD8806  
`Teensy Arduino:` http://www.pjrc.com/teensy/td_download.html  
`Arduino Software:` http://arduino.cc/en/Main/Software  

Solder
------
LED -> Teensy  
gnd -> gnd  
+5v -> vcc  
D1 -> B2  
C1 -> B1  

Usage and Configuration
-----------------------

Contributions
-------------
Please provide a pull request.  


Inspiration
-----------
Inspiration for this project came from Rick Osgood who built a similar devicde.  You can check his blog out [here.](http://www.richardosgood.com/2012/03/01/splunk-led-meter-complete/)

License and Author
==================

Author:: Bryan Brandau <agent462@gmail.com>

Copyright:: 2013, Bryan Brandau

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
