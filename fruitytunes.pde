//Fruity Tunes 
//Processing Code
//Carolynn Vu

import ddf.minim.*;
import processing.serial.*;

Minim minim;
AudioPlayer player5;
AudioPlayer player4;
AudioPlayer player3;
AudioPlayer player2;
AudioPlayer player1;
AudioPlayer scary;
Serial arduinoPort;

int[] prev = new int[5];

void setup()
{
  size(512, 200, P3D);
  minim = new Minim(this);
  println(Serial.list());
  String portName = Serial.list()[0];
  arduinoPort = new Serial(this, portName, 9600);

  player1 = minim.loadFile("BicycleBell.mp3", 512); //Grapes//
  player2 = minim.loadFile( "Ting.mp3", 512); //Kiwi//
  player3 = minim.loadFile("TOM03M.wav", 512); //Pineapple//
  player4 = minim.loadFile("CRASH03.wav", 512); //Orange//
  player5 = minim.loadFile("ClayDumbekTone01.wav", 512);
  scary = minim.loadFile("IWILLKILLYOU.mp3", 512); //Surpise 

}

void draw()
{
  background(0);
  stroke(255);
}

void serialEvent(Serial arduinoPort) {

  String string = arduinoPort.readStringUntil('\n');
  if (string!=null) {
    string = trim(string);
    int[] values = int(split(string, ','));
    println(values);

    //KIWI//
    if (values[0] > 200 && prev[0]<= 200) {
      player1.rewind();
      player1.play();
    }
 
    //GRAPES//
    if (values[1]  > 40  && prev[1]<= 40) {
      player2.rewind();
      player2.play();
    }

    //PINEAPPLE//
    if (values[2] > 40 && prev[2]<= 40) {
      player3.rewind();
      player3.play();
    }
  
   //ORANGE//
   if (values[3] > 50 && prev[3]<= 50) {
      player4.rewind();
      player4.play();
    }
 
    //MANGO//
    if (values[4] > 50 && prev[4]<= 50) {
      player5.rewind();
      player5.play();
    }


    for(int i=0;i<4;i++){
      prev[i]=values[i];
    }
  }
}
