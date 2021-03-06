#include <Servo.h>
int tf;
int modo=0;

byte servo_1[300];
byte servo_2[300];
byte servo_3[300];
byte servo_4[300];
byte servo_5[300];
byte servo_6[300];

byte servo_1p[100];
byte servo_2p[100];
byte servo_3p[100];
byte servo_4p[100];
byte servo_5p[100];
byte servo_6p[100];

Servo servo1;
Servo servo2; 
Servo servo3; 
Servo servo4; 
Servo servo5;
Servo servo6; 

void setup(){
  Serial.begin(50000);
  servo1.attach(2,900,2100);
  servo2.attach(3,900,2100);
  servo3.attach(4,900,2100);
  servo4.attach(5,900,2100);
  servo5.attach(6,900,2100);
  servo6.attach(7,900,2100);
}

void recebe_tipo(){
  int w=0;
  while(w<1){
    if(Serial.available()>0){
      modo=Serial.read();
      w++;
    }
  }
}

void recebe_300(){
  int w=0;
    w=0;
    while(w<1){
      if(Serial.available()>0){
        tf=Serial.read();
        w++;
      }
    }
    w=0;
    while(w<300){
      if(Serial.available()>0){
        servo_1[w]=map(Serial.read(),0,255,0,180);
        w++;
      }
    }
    w=0;
    while(w<300){
      if(Serial.available()>0){
        servo_2[w]=map(Serial.read(),0,255,0,180);
        w++;
      }
    }
    w=0;
    while(w<300){
      if(Serial.available()>0){
        servo_3[w]=map(Serial.read(),0,255,0,180);
        w++;
      }
    }
    w=0;
    while(w<300){
      if(Serial.available()>0){
        servo_4[w]=map(Serial.read(),0,255,0,180);
        w++;
      }
    }
    w=0;
    while(w<300){
      if(Serial.available()>0){
        servo_5[w]=map(Serial.read(),0,255,0,180);
        w++;
      }
    }
    w=0;
    while(w<300){
      if(Serial.available()>0){
        servo_6[w]=map(Serial.read(),0,255,0,180);
        w++;
      }
    }
}

void recebe_100(){
  int w=0;
    w=0;
    while(w<1){
      if(Serial.available()>0){
        tf=Serial.read();
        w++;
      }
    }
    w=0;
    while(w<100){
      if(Serial.available()>0){
        servo_1p[w]=map(Serial.read(),0,255,0,180);
        w++;
      }
    }
    w=0;
    while(w<100){
      if(Serial.available()>0){
        servo_2p[w]=map(Serial.read(),0,255,0,180);
        w++;
      }
    }
    w=0;
    while(w<100){
      if(Serial.available()>0){
        servo_3p[w]=map(Serial.read(),0,255,0,180);
        w++;
      }
    }
    w=0;
    while(w<100){
      if(Serial.available()>0){
        servo_4p[w]=map(Serial.read(),0,255,0,180);
        w++;
      }
    }
    w=0;
    while(w<100){
      if(Serial.available()>0){
        servo_5p[w]=map(Serial.read(),0,255,0,180);
        w++;
      }
    }
    w=0;
    while(w<100){
      if(Serial.available()>0){
        servo_6p[w]=map(Serial.read(),0,255,0,180);
        w++;
      }
    }
}
  
void loop(){
  
  recebe_tipo();
  
  if(modo == 0){
  recebe_100();
  }
  if(modo == 1){
  recebe_300();
  }
  
  if(modo ==0){
    for(int i=0;i<100;i++){
      servo1.write(servo_1p[i]);
      servo2.write(servo_2p[i]);
      servo3.write(servo_3p[i]);
      servo4.write(servo_4p[i]);
      servo5.write(servo_5p[i]);
      servo6.write(servo_6p[i]);
      delay((tf*1000)/100);
    }
  }
  if(modo == 1){
    for(int i=0;i<300;i++){
      servo1.write(servo_1[i]);
      servo2.write(servo_2[i]);
      servo3.write(servo_3[i]);
      servo4.write(servo_4[i]);
      servo5.write(servo_5[i]);
      servo6.write(servo_6[i]);
      delay((tf*1000)/100);
    }    
  }
}
