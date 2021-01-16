#include <FreqPeriodCounter.h>
  
FreqPeriodCounter counter1(2, micros, 0);

  
void setup(void)
{
  Serial.begin(115200);
  pinMode(5, OUTPUT);
  analogWrite(5, 255); //Spark PWM is fixed to 500Hz.  Setup for 50% duty cycle
}
  
void loop(void)
{ counter1.poll();
  float f1 = counter1.period;
  Serial.print("\n");
  Serial.print(f1);

}
