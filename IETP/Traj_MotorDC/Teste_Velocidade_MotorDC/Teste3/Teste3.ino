#include <FreqPeriodCounter.h>

/* Note: connect pin D3 to pin A1 */
const int counterPin = 2;    // connect pin 3 to pin 9
const int PWMpin     = 5;    // PWM only pin 9 or 10

FreqPeriodCounter freqPeriodCounter(counterPin, micros);
float hz = 0;

void setup(void)
{
  Serial.begin(115200);
  pinMode(counterPin, INPUT);
  pinMode(PWMpin, OUTPUT);
  analogWrite(PWMpin, 255); //Spark PWM is fixed to 500Hz.  Setup for 50% duty cycle
  attachInterrupt(digitalPinToInterrupt(counterPin), counterISR, CHANGE);
}

void counterISR()
{
  if (freqPeriodCounter.poll()) {
    Serial.print("period [ms]= ");
    Serial.println(freqPeriodCounter.period);
    Serial.print("high [ms]  = ");
    Serial.println(freqPeriodCounter.pulseWidth);
    Serial.print("low [ms]   = ");
    Serial.println(freqPeriodCounter.pulseWidthLow);
    Serial.print("hertz      = ");
    hz = 1/(freqPeriodCounter.period);
    Serial.println(hz);
  }
}

void loop(void)
{


}
