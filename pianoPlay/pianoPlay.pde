import ddf.minim.*;
Minim minim;

AudioPlayer Do, Re, Mi, Fa, Sol, La, Si;

void setup(){
 size(800,500);
 minim = new Minim(this);
 Do = minim.loadFile("/notes/28.mp3");
 Re = minim.loadFile("/notes/30.mp3");
 Mi = minim.loadFile("/notes/32.mp3");
 Fa = minim.loadFile("/notes/33.mp3");
 Sol = minim.loadFile("/notes/35.mp3");
 La = minim.loadFile("/notes/37.mp3");
 Si = minim.loadFile("/notes/39.mp3");
 
}
boolean teste = true;

void keyPressed(){
  if (teste && key == 'q') {
   Do.rewind();
   Do.play();
   teste = false;
  }
  if (teste && key == 'w') {
   Re.rewind();
   Re.play();
   teste = false;
  }
  if (teste && key == 'e') {
   Mi.rewind();
   Mi.play();
   teste = false;
  }
  if (teste && key == 'r') {
   Fa.rewind();
   Fa.play();
   teste = false;
  }
  if (teste && key == 't') {
   Sol.rewind();
   Sol.play();
   teste = false;
  }
  if (teste && key == 'y') {
   La.rewind();
   La.play();
   teste = false;
  }
  if (teste && key == 'u') {
   Si.rewind();
   Si.play();
   teste = false;
  }
}

void keyReleased() {
  teste = true; 
}

void draw(){
 teclas();
 if (keyPressed) {
  if (key == 'q') {
   Do();  
  }
 }

 if (keyPressed) {
  if (key == 'w') {
   Re();
  }
 }

 if (keyPressed) {
  if (key == 'e') {
   Mi();
  }
 }
 
if (keyPressed) {
  if (key == 'r') {
   Fa();
  }
 }

 if (keyPressed) {
  if (key == 't') {
   Sol();
  }
 }
 
 if (keyPressed) {
  if (key == 'y') {
   La();
  }
 }

 if (keyPressed) {
  if (key == 'u') {
   Si();
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
