
//Controls a Servo Motor using the info from an IR Distance Sensor

//Include Servo Library
#include <Servo.h>

//Define Pins
int servoPin = 9;

//Create Servo Object
Servo Servo;

void setup()
{
 //Start Serial
 Serial.begin(9600);
  
  //Attaches the Servo to our object
  Servo.attach(servoPin);
  
  delay(500);
}

void loop()
{  

  while( Serial.available() == 0);
  int data = Serial.read() -'0';

  int pos = map(data, 0, 9, 0, 180);
  pos = constrain(pos, 0, 180);

  //Turn the servo
  Serial.println(pos);
  Servo.write(pos);
  Serial.flush();  
  
  
}
