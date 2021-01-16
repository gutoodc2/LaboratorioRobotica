#define PINO_PWM  5

int  tf;
int  maxremap;
byte motor[100];

const int pulsePin = 2; // Pino do encoder
int pulseHigh; 
int pulseLow; 
float pulseTotal; 
float periodo;
float frequency;

void setup() {
  Serial.begin(9600);
  pinMode(pulsePin, INPUT);
  pinMode(PINO_PWM, OUTPUT);
  //attachInterrupt(digitalPinToInterrupt(pulsePin), verifyFreq, CHANGE);
}

//void verifyFreq(){
//  Serial.print("\nFrequency is ");
//
//  pulseHigh = pulseIn(pulsePin, HIGH);
//
//  pulseLow = pulseIn(pulsePin, LOW);
//
//  pulseTotal = pulseHigh + pulseLow; // Time period of the pulse in microseconds
//
//  Serial.print(1/(pulseTotal/1000000)); // Convert period from microseconds to secons and obtain frequency
//  Serial.print(" Hz");
//}

void recebe(){
  int w=0;
  while(w<1){
    if(Serial.available()>0){
      tf=Serial.read();
      w++;
    }
  }
  w=0;
  while(w<1){
    if(Serial.available()>0){
      maxremap=Serial.read();
      w++;
    }
  }
  w=0;
  while(w<100){
    if(Serial.available()>0){
      motor[w]=map(Serial.read(), 0, maxremap, 0 , 255);
      w++;
    }
  }
} 

void loop(){
  recebe();
  for(int i=0;i<100;i++){
    analogWrite(PINO_PWM, motor[i]);
    delay((tf*1000)/100);
    //pulseHigh = pulseIn(pulsePin, HIGH);
    //pulseLow = pulseIn(pulsePin, LOW);
    //pulseTotal = pulseHigh + pulseLow;
    //frequency = 1/(pulseTotal/1000000);
  }
}
