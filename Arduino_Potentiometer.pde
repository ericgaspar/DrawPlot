// Automatic Drawing
// 24. 09. 2017

import processing.pdf.*;
import processing.serial.*;
import cc.arduino.*;

Arduino arduino;

int xpin = 0;
int ypin = 1;
float value = 0;

PShape dessin;

void setup() {
	fullScreen();
	beginRecord(PDF, "A.pdf");
	arduino = new Arduino(this, Arduino.list()[0], 57600);
	arduino.pinMode(xpin, Arduino.INPUT);
	arduino.pinMode(ypin, Arduino.INPUT);
	dessin = loadShape("A.svg");
}

void draw(){
	shape(dessin, arduino.analogRead(xpin), 0, 300, arduino.analogRead(ypin));
}

void keyPressed(){
	if (key=='Q') {
		endRecord();
	}
	if (key=='N') {
		background(200);
	}
}