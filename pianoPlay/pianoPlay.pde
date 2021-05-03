import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
import processing.sound.*;
Minim minim;

AudioPlayer Do;
AudioPlayer Re;
AudioPlayer Mi;
AudioPlayer Fa;
AudioPlayer Sol;
AudioPlayer La;
AudioPlayer Si;


void setup(){
 size(800,500);
 minim = new Minim(this);
}

void draw(){
 teclas();
 if (keyPressed) {
  if (key == 'q') {
   Do();
   Do = minim.loadFile("/notes/28.mp3");
   Do.play();
   
  }
 }

 if (keyPressed) {
  if (key == 'w') {
   Re();
   Re = minim.loadFile("/notes/30.mp3");
   Re.play();
  }
 }

 if (keyPressed) {
  if (key == 'e') {
   Mi();
   Mi = minim.loadFile("/notes/32.mp3");
   Mi.play();
  }
 }
 
if (keyPressed) {
  if (key == 'r') {
   Fa();
   Fa = minim.loadFile("/notes/33.mp3");
   Fa.play();
  }
 }

 if (keyPressed) {
  if (key == 't') {
   Sol();
   Sol = minim.loadFile("/notes/35.mp3");
   Sol.play();
  }
 }
 
 if (keyPressed) {
  if (key == 'y') {
   La();
   La = minim.loadFile("/notes/37.mp3");
   La.play();
  }
 }

 if (keyPressed) {
  if (key == 'u') {
   Si();
   Si = minim.loadFile("/notes/39.mp3");
   Si.play();
  }
 }
}



void teclas() {
 fill(255);   rect(0,380, 40,120);  fill(0);  text("Dó", 10,485);
 fill(255);   rect(41,380,40,120);  fill(0);  text("Ré", 51,485);
 fill(255);   rect(82,380,40,120);  fill(0);  text("Mi", 92,485);
 fill(255);   rect(123,380,40,120);  fill(0);  text("Fá", 133,485);
 fill(255);   rect(164,380,40,120);  fill(0);  text("Sol", 174,485);
 fill(255);   rect(205,380,40,120);  fill(0);  text("Lá", 215,485);
 fill(255);   rect(246,380,40,120);  fill(0);  text("Si", 256,485); 
}

void Do(){
 fill(135);   rect(0,380, 40,120);  fill(0);  text("Dó", 10,485);
}

void Re(){
 fill(135);   rect(41,380,40,120);  fill(0);  text("Ré", 51,485);
}

void Mi(){
 fill(135);   rect(82,380,40,120);  fill(0);  text("Mi", 92,485);
}

void Fa(){
 fill(135);   rect(123,380,40,120);  fill(0);  text("Fá", 133,485);
}

void Sol(){
 fill(135);   rect(164,380,40,120);  fill(0);  text("Sol", 174,485);
}

void La(){
 fill(135);   rect(205,380,40,120);  fill(0);  text("Lá", 215,485);
}

void Si(){
 fill(135);   rect(246,380,40,120);  fill(0);  text("Si", 256,485);  
}

void stop()
{
  Do.close();
  super.stop();
}
