#include <Servo.h>
int tf;
byte servo_1[100];

Servo servo1;

void setup(){
  Serial.begin(9600);
  servo1.attach(2,900,2100);
  
}

void recebe(){
  int w=0;
  while(w<1){
    if(Serial.available()>0){
      tf=Serial.read();
      w++;
    }
  }
  w=0;
  while(w<100){
    if(Serial.available()>0){
      servo_1[w]=Serial.read();
      w++;
    }
  }
} 
void loop(){
  recebe();
  for(int i=0;i<100;i++){
    servo1.write(servo_1[i]);
    delay((tf*1000)/100);
  }
}
