const int pulsePin = 2; // Pino do encoder
int pulseHigh; 
int pulseLow; 
float pulseTotal; 
float periodo;

void setup() {
  Serial.begin(115200);
  pinMode(pulsePin, INPUT);
  pinMode(5, OUTPUT);
  analogWrite(5, 255);
  attachInterrupt(digitalPinToInterrupt(pulsePin), verifyFreq, CHANGE);
}

void verifyFreq(){
  Serial.print("\nFrequency is ");

  pulseHigh = pulseIn(pulsePin, HIGH);

  pulseLow = pulseIn(pulsePin, LOW);

  pulseTotal = pulseHigh + pulseLow; // Time period of the pulse in microseconds

  Serial.print(1/(pulseTotal/1000000)); // Convert period from microseconds to secons and obtain frequency
  Serial.print(" Hz");
}

void loop() {

}
