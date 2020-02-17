

const int greenLEDPin = 9;
const int redLEDPin = 11;
const int blueLEDPin = 10;





void setup() {
  // put your setup code here, to run once:
// initialize the serial communication:
  Serial.begin(9600);
  // initialize the 3 lEDPins as outputs:
  pinMode(greenLEDPin,OUTPUT);
  pinMode(redLEDPin,OUTPUT);
  pinMode(blueLEDPin,OUTPUT);
  
}
  
void loop() {
  byte tweetValue;


  // check if data has been sent from the computer:
  if (Serial.available()) {
    // read the most recent byte (which will be from 0 to 255):
    tweetValue = Serial.read();
    // set the brightness of the LED:
if (tweetValue<127){
analogWrite(redLEDPin, map(tweetValue, 0, 126, 255, 0));//maps a negative tweet value to the red LED
analogWrite(blueLEDPin, 0);
analogWrite(greenLEDPin, 255);} 
else{
  (analogWrite(blueLEDPin, map(tweetValue, 127, 255, 0, 255)));//maps a positive tweet value to the blue LED   
   analogWrite(redLEDPin, 0);
  analogWrite(greenLEDPin, 255);} 
       

  }}
