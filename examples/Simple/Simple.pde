/*
  Simple - Example file for MD23 library.
  Interfacing with MD23 - Dual 12Volt 3Amp H Bridge Motor Drive in i2c Mode.
  Created by Nicola Lugato, September 2008.
  Contacts: nicola.lugato@gmail.com

  Released into the public domain.
  
  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

  Info:
  
  This program control a Dual 12Volt 3Amp H Bridge Motor Drive in i2c mode.
  
  It should run motor1 at low speed for 1 second and then stop for 1 second.
  
  See: http://www.robot-electronics.co.uk/htm/md23tech.htm

*/

#include <Wire.h>
#include <MD23.h>

MD23 md23;	// create an MD23 object with default address

void setup()
{
  Wire.begin();	// you have to init the i2c bus by yourself
  md23.setMode(0);	// set the mode (0 is default, so not really useful :P)
}

void loop()
{
  md23.setMotor1Speed(128);	// stop the first motor
  delay(1000);
  md23.setMotor1Speed(150);	// slow forwad, first motor
  delay(1000);
}
