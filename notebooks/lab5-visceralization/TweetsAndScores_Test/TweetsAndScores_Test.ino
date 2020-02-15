

const int motorPin = 9;      // the pin that the motor is attached to



void setup() {
  // put your setup code here, to run once:
// initialize the serial communication:
  Serial.begin(9600);
  // initialize the ledPin as an output:
  pinMode(motorPin, OUTPUT);
}

void loop() {
  byte brightness;

  // check if data has been sent from the computer:
  if (Serial.available()) {
    // read the most recent byte (which will be from 0 to 255):
    brightness = Serial.read();
    // set the brightness of the LED:
    analogWrite(motorPin, brightness);

  }}
