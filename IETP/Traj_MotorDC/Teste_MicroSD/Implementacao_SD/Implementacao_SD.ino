#include <SPI.h>
#include <SD.h>

#define PINO_PWM  5

// Inicializando variaveis
File myFile;

int  tf = 36;
byte motor[100];
float periodos[100];

const int pulsePin = 2; // Pino do encoder
unsigned long pulseHigh;
unsigned long pulseLow;
float pulseTotal;
float periodo;
float frequency;
String wordSD;

void setup() {
  // Parametros iniciais do programa
  Serial.begin(9600);
  pinMode(pulsePin, INPUT);
  pinMode(PINO_PWM, OUTPUT);
  //attachInterrupt(digitalPinToInterrupt(pulsePin), verifyFreq, CHANGE);

  // Verificação Inicial do SD
  while (!Serial) {
  }
  Serial.print("Initializing SD card...");
  if (!SD.begin(4)) {
    Serial.println("initialization failed!");
    while (1);
  }
  Serial.println("initialization done.");
  readSD();
}

void verifyFreq() {
  Serial.print("\nFrequency is ");

  pulseHigh = pulseIn(pulsePin, HIGH);

  pulseLow = pulseIn(pulsePin, LOW);

  pulseTotal = pulseHigh + pulseLow; // Time period of the pulse in microseconds

  Serial.print(1 / (pulseTotal / 1000000)); // Convert period from microseconds to secons and obtain frequency
  Serial.print(" Hz");
}

void readSD() {
  int i = 0;
  myFile = SD.open("in_pb.txt");
  if (myFile) {
    Serial.println("in_pb.txt:");

    // read from the file until there's nothing else in it:
    while (myFile.available()) {
      //Serial.write(myFile.read());
      wordSD = myFile.readStringUntil('\n');
      motor[i] = map(wordSD.toInt(), 0, 12, 0 , 255);
      //Serial.println(motor[i]);
      i++;
    }
    // close the file:
    myFile.close();
  } else {
    // if the file didn't open, print an error:
    Serial.println("error opening input file");
  }
}

void writeSD() {
  myFile = SD.open("out_pb.txt", FILE_WRITE);

  // if the file opened okay, write to it:
  if (myFile) {
    for (int i = 0; i < 100; i++) {
      myFile.println(periodos[i]);
      // close the file:
      Serial.println("done.");
    }
    myFile.close();
  } else {
    // if the file didn't open, print an error:
    Serial.println("error opening out file");
  }

}

void loop() {
  for (int i = 0; i < 100; i++) {
    analogWrite(PINO_PWM, motor[i]);
    //Serial.println(i);
    delay((tf * 1000) / 100);
    pulseHigh = pulseIn(pulsePin, HIGH);
    pulseLow = pulseIn(pulsePin, LOW);
    //pulseTotal = pulseHigh + pulseLow;
    periodos[i]= pulseHigh + pulseLow; 
    //frequency = (1 / pulseTotal) * 1000000;
    //Serial.print("\nFrequency: ");
    Serial.print("\nPeriod: ");
    Serial.print(periodos[i]);
    Serial.print("uS");
    //Serial.print("Hz");
  }
  writeSD();
  while (true) {}

}
