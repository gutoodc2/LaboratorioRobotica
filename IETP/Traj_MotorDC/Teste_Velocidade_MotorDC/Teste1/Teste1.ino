#include <FreqPeriodCounter.h>

#define PINO_PWM  5
const byte counterPin = 5; //PWM talvez
const byte counterInterrupt = 2;
FreqPeriodCounter counter(counterPin, micros, 10);

void setup(void) {
  Serial.begin(9600);
  pinMode(counterPin, INPUT);
  pinMode(PINO_PWM, OUTPUT);
  attachInterrupt(counterInterrupt, counterISR, CHANGE);
}

void counterISR() {
  counter.poll();
}

void loop(void) {
  int period;
  if (counter.ready()){
    period = counter.period;
    Serial.println(period);
  }
  analogWrite(PINO_PWM, 255);
}
