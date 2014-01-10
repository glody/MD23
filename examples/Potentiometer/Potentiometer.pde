/*
  Potentiometer - Example file for MD23 library.
  Interfacing with MD23 - Dual 12Volt 3Amp H Bridge Motor Drive in i2c Mode.
  Created by Nicola Lugato, September 2008.
  Contacts: nicola.lugato@gmail.com

  Released into the public domain.
  
  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

  Info:
  
  This program control a Dual 12Volt 3Amp H Bridge Motor Drive in i2c mode.
  Control the speed of Motors 1 with a potentiometer (on Analog Input 2), outputs values on the serial line.
  
  See: http://www.robot-electronics.co.uk/htm/md23tech.htm

*/


#include <Wire.h>
#include <MD23.h>

MD23 md23;	// create an MD23 object with default address
int potPin = 2; // a potentiometer connected to analog input 2

void setup()
{
  Serial.begin(9600);
  Wire.begin();	// you have to init the i2c bus by yourself
  md23.setMode(0);	// set the mode (0 is default, so not really useful :P)
}

void loop()
{
  int val = analogRead(potPin);
  md23.setMotor1Speed(val / 4);	// scale from 0-1023 to 0-255 
  
  Serial.print("Speed:");
  Serial.print(md23.getMotor1Speed(), DEC);
  Serial.print("  Curr:");
  Serial.print(md23.getMotor1Current(), DEC);
  Serial.print("  Volts:");
  Serial.println(md23.getBatteryVolts(), DEC);  
}
