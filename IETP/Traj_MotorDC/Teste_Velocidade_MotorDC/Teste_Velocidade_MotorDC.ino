 unsigned int subida;
 unsigned int rpm;
 unsigned long timenow;
 unsigned long timeold;
 
 #define PINO_PWM  5
 
 void setup()
 {
   Serial.begin(9600);
   attachInterrupt(0, rpm_fun, RISING);
   subida = 0;
   rpm = 0;
   timenow = 0;
   timeold = 0;
   pinMode(PINO_PWM, OUTPUT);
 }
 
 void rpm_fun()
 {
   if(subida ==1){
      timenow = millis();
      subida++;
   }else{
      subida++;
      timeold = millis();
   }
 }
 
 void loop()
 {
   if (subida % 2 == 0) {
     rpm = timenow - timeold;
     subida = 0;
     Serial.println(rpm,DEC);
   }
   analogWrite(PINO_PWM, 255);
 }
