const int pulsePin = 2; // Input signal connected to Pin 12 of Arduino

int pulseHigh; // Integer variable to capture High time of the incoming pulse

int pulseLow; // Integer variable to capture Low time of the incoming pulse

float pulseTotal; // Float variable to capture Total time of the incoming pulse

float periodo;

void setup() {
  Serial.begin(115200);
  pinMode(pulsePin, INPUT);
  pinMode(5, OUTPUT);
  analogWrite(5, 255); //Spark PWM is fixed to 500Hz.  Setup for 50% duty cycle
}

void loop() {

  Serial.print("\nFrequency is ");

  pulseHigh = pulseIn(pulsePin, HIGH);

  pulseLow = pulseIn(pulsePin, LOW);

  pulseTotal = pulseHigh + pulseLow; // Time period of the pulse in microseconds

  Serial.print(1/(pulseTotal/1000000));
  Serial.print(" Hz");
  delay(500);

}
