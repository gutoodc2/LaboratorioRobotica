#include <Streaming.h>
#include <FreqPeriodCounter.h>
#define PINO_PWM  5

const byte freqPin = 2;
#define debounceTime_ms 10

FreqPeriodCounter freqPeriodCounter(freqPin, millis, debounceTime_ms);

void setup(void) 
{ 
  Serial.begin(115200);
  pinMode(PINO_PWM, OUTPUT);
  Serial.println("MEASURE PERIOD");
  
}

void loop(void) 
{ 
  if (freqPeriodCounter.poll()) {
  Serial.print("period [ms]= ");
  Serial.println(freqPeriodCounter.period);
  Serial.print("high [ms]  = ");
  Serial.println(freqPeriodCounter.pulseWidth);
  Serial.print("low [ms]   = ");
  Serial.println(freqPeriodCounter.pulseWidthLow);
  Serial.print("hertz      = ");
  Serial.println(freqPeriodCounter.hertz(5), 5);
  }
  analogWrite(PINO_PWM, 255);
}
