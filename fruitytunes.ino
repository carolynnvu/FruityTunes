//Fruity Tunes
//Arduino Code
//Carolynn Vu 

#include <CapacitiveSensor.h>

CapacitiveSensor cs_2_3 = CapacitiveSensor(2,3); //KIWI//
CapacitiveSensor cs_2_5 = CapacitiveSensor(2,5); //GRAPES//
CapacitiveSensor cs_2_4 = CapacitiveSensor(2,4); //PINEAPPLE//
CapacitiveSensor cs_2_9 = CapacitiveSensor(2,9); //ORANGE//
CapacitiveSensor cs_2_11 = CapacitiveSensor(2,11); //ORANGE//

void setup()                    
{
   Serial.begin(9600);
}

void loop()                    
{
    long start = millis();

    long total1 =  cs_2_3.capacitiveSensor(10); 
    long total2 =  cs_2_5.capacitiveSensor(10);
    long total3 =  cs_2_4.capacitiveSensor(10);
    long total4 =  cs_2_9.capacitiveSensor(10);
    long total5 =  cs_2_11.capacitiveSensor(10);
      
    Serial.print(total1);
    Serial.print(',');
    Serial.print(total2);
    Serial.print(',');
    Serial.print(total3);
    Serial.print(',');
    Serial.print(total4);
    Serial.print(',');
    Serial.print(total5);
    Serial.println(',');
    
 
    delay(10);                            
}
