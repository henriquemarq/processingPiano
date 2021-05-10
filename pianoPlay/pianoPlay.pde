import java.util.Arrays;
import ddf.minim.analysis.*;
import ddf.minim.*;
Minim minim;
AudioInput in;
FFT fftDo, fftRe, fftMi, fftFa, fftSol, fftLa, fftSi;

AudioPlayer Do1, Re1, Mi1, Fa1, Sol1, La1, Si1, Do2, Re2, Mi2, Fa2, Sol2, La2, Si2,
Do3, Re3, Mi3, Fa3, Sol3, La3, Si3, Do4, Re4, Mi4, Fa4, Sol4, La4, Si4,
Do5, Re5, Mi5, Fa5, Sol5, La5, Si5, Do6, Re6, Mi6, Fa6, Sol6, La6, Si6,
Do7, Re7, Mi7, Fa7, Sol7, La7, Si7, Do8, Re8, Mi8, Fa8, Sol8, La8, Si8,
DoS1, ReS1, FaS1, SolS1, LaS1, DoS2, ReS2, FaS2, SolS2, LaS2, 
DoS3, ReS3, FaS3, SolS3, LaS3, DoS4, ReS4, FaS4, SolS4, LaS4,
DoS5, ReS5, FaS5, SolS5, LaS5, DoS6, ReS6, FaS6, SolS6, LaS6,
DoS7, ReS7, FaS7, SolS7, LaS7, DoS8, ReS8, FaS8, SolS8, LaS8;

ArrayList<FFT> elementos;
ArrayList<AudioPlayer> elementos2;

// how many individual peak bands we have (dep. binsperband)
float gain = 0; // in dB
float dB_scale = 3.0;  // pixels per dB
int buffer_size = 1024;  // also sets FFT size (frequency resolution)
float sample_rate = 44100;

int spectrum_height = 200; // determines range of dB shown
int legend_height = 20;
int spectrum_width = 512; // determines how much of spectrum we see
int legend_width = 40;
int freqOffset = 0;

final color colSelected=color(255,0,0);
final color colPlain=color(255);

int state = 0;

void setup(){
 size(800,500);
 minim = new Minim(this); 
 
 //Primeira Oitava
 Do1 = minim.loadFile("/notes/Dó1.mp3");
 Re1 = minim.loadFile("/notes/Ré1.mp3");
 Mi1 = minim.loadFile("/notes/Mi1.mp3");
 Fa1 = minim.loadFile("/notes/Fá1.mp3");
 Sol1 = minim.loadFile("/notes/Sol1.mp3");
 La1 = minim.loadFile("/notes/Lá1.mp3");
 Si1 = minim.loadFile("/notes/Si1.mp3");
 //Segunda Oitava
 Do2 = minim.loadFile("/notes/Dó2.mp3");
 Re2 = minim.loadFile("/notes/Ré2.mp3");
 Mi2 = minim.loadFile("/notes/Mi2.mp3");
 Fa2 = minim.loadFile("/notes/Fá2.mp3");
 Sol2 = minim.loadFile("/notes/Sol2.mp3");
 La2 = minim.loadFile("/notes/Lá2.mp3");
 Si2 = minim.loadFile("/notes/Si2.mp3");
 //Terceira Oitava
 Do3 = minim.loadFile("/notes/Dó3.mp3");
 Re3 = minim.loadFile("/notes/Ré3.mp3");
 Mi3 = minim.loadFile("/notes/Mi3.mp3");
 Fa3 = minim.loadFile("/notes/Fá3.mp3");
 Sol3 = minim.loadFile("/notes/Sol3.mp3");
 La3 = minim.loadFile("/notes/Lá3.mp3");
 Si3 = minim.loadFile("/notes/Si3.mp3");
 //Quarta Oitava
 Do4 = minim.loadFile("/notes/Dó4.mp3");
 Re4 = minim.loadFile("/notes/Ré4.mp3");
 Mi4 = minim.loadFile("/notes/Mi4.mp3");
 Fa4 = minim.loadFile("/notes/Fá4.mp3");
 Sol4 = minim.loadFile("/notes/Sol4.mp3");
 La4 = minim.loadFile("/notes/Lá4.mp3");
 Si4 = minim.loadFile("/notes/Si4.mp3");
 //Quinta Oitava
 Do5 = minim.loadFile("/notes/Dó5.mp3");
 Re5 = minim.loadFile("/notes/Ré5.mp3");
 Mi5 = minim.loadFile("/notes/Mi5.mp3");
 Fa5 = minim.loadFile("/notes/Fá5.mp3");
 Sol5 = minim.loadFile("/notes/Sol5.mp3");
 La5 = minim.loadFile("/notes/Lá5.mp3");
 Si5 = minim.loadFile("/notes/Si5.mp3");
 //Sexta Oitava
 Do6 = minim.loadFile("/notes/Dó6.mp3");
 Re6 = minim.loadFile("/notes/Ré6.mp3");
 Mi6 = minim.loadFile("/notes/Mi6.mp3");
 Fa6 = minim.loadFile("/notes/Fá6.mp3");
 Sol6 = minim.loadFile("/notes/Sol6.mp3");
 La6 = minim.loadFile("/notes/Lá6.mp3");
 Si6 = minim.loadFile("/notes/Si6.mp3");
 //Setima Oitava
 Do7 = minim.loadFile("/notes/Dó7.mp3");
 Re7 = minim.loadFile("/notes/Ré7.mp3");
 Mi7 = minim.loadFile("/notes/Mi7.mp3");
 Fa7 = minim.loadFile("/notes/Fá7.mp3");
 Sol7 = minim.loadFile("/notes/Sol7.mp3");
 La7 = minim.loadFile("/notes/Lá7.mp3");
 Si7 = minim.loadFile("/notes/Si7.mp3");
 //Oitava Oitava
 Do8 = minim.loadFile("/notes/Dó8.mp3");
 Re8 = minim.loadFile("/notes/Ré8.mp3");
 Mi8 = minim.loadFile("/notes/Mi8.mp3");
 Fa8 = minim.loadFile("/notes/Fá8.mp3");
 Sol8 = minim.loadFile("/notes/Sol8.mp3");
 La8 = minim.loadFile("/notes/Lá8.mp3");
 Si8 = minim.loadFile("/notes/Si8.mp3");
 
 //Notas Sustenidas
 
 //Primeira Oitava
 DoS1 = minim.loadFile("/notes/Dó#1.mp3");
 ReS1 = minim.loadFile("/notes/Ré#1.mp3");
 FaS1 = minim.loadFile("/notes/Fá#1.mp3");
 SolS1 = minim.loadFile("/notes/Sol#1.mp3");
 LaS1 = minim.loadFile("/notes/Lá#1.mp3");
 //Segunda Oitava
 DoS2 = minim.loadFile("/notes/Dó#2.mp3");
 ReS2 = minim.loadFile("/notes/Ré#2.mp3");
 FaS2 = minim.loadFile("/notes/Fá#2.mp3");
 SolS2 = minim.loadFile("/notes/Sol#2.mp3");
 LaS2 = minim.loadFile("/notes/Lá#2.mp3");
 //Terceira Oitava
 DoS3 = minim.loadFile("/notes/Dó#3.mp3");
 ReS3 = minim.loadFile("/notes/Ré#3.mp3");
 FaS3 = minim.loadFile("/notes/Fá#3.mp3");
 SolS3 = minim.loadFile("/notes/Sol#3.mp3");
 LaS3 = minim.loadFile("/notes/Lá#3.mp3");
 //Quarta Oitava
 DoS4 = minim.loadFile("/notes/Dó#4.mp3");
 ReS4 = minim.loadFile("/notes/Ré#4.mp3");
 FaS4 = minim.loadFile("/notes/Fá#4.mp3");
 SolS4 = minim.loadFile("/notes/Sol#4.mp3");
 LaS4 = minim.loadFile("/notes/Lá#4.mp3");
 //Quinta Oitava
 DoS5 = minim.loadFile("/notes/Dó#5.mp3");
 ReS5 = minim.loadFile("/notes/Ré#5.mp3");
 FaS5 = minim.loadFile("/notes/Fá#5.mp3");
 SolS5 = minim.loadFile("/notes/Sol#5.mp3");
 LaS5 = minim.loadFile("/notes/Lá#5.mp3");
 //Sexta Oitava
 DoS6 = minim.loadFile("/notes/Dó#6.mp3");
 ReS6 = minim.loadFile("/notes/Ré#6.mp3");
 FaS6 = minim.loadFile("/notes/Fá#6.mp3");
 SolS6 = minim.loadFile("/notes/Sol#6.mp3");
 LaS6 = minim.loadFile("/notes/Lá#6.mp3");
 //Setima Oitava
 DoS7 = minim.loadFile("/notes/Dó#7.mp3");
 ReS7 = minim.loadFile("/notes/Ré#7.mp3");
 FaS7 = minim.loadFile("/notes/Fá#7.mp3");
 SolS7 = minim.loadFile("/notes/Sol#7.mp3");
 LaS7 = minim.loadFile("/notes/Lá#7.mp3");
 //Oitava Oitava
 DoS8 = minim.loadFile("/notes/Dó#8.mp3");
 ReS8 = minim.loadFile("/notes/Ré#8.mp3");
 FaS8 = minim.loadFile("/notes/Fá#8.mp3");
 SolS8 = minim.loadFile("/notes/Sol#8.mp3");
 LaS8 = minim.loadFile("/notes/Lá#8.mp3");
 
  fftDo = new FFT(Do1.bufferSize(), Do1.sampleRate());
  fftRe = new FFT(Re1.bufferSize(), Re1.sampleRate());
  fftMi = new FFT(Mi1.bufferSize(), Mi1.sampleRate());
  fftFa = new FFT(Fa1.bufferSize(), Fa1.sampleRate());
  fftSol = new FFT(Sol1.bufferSize(), Sol1.sampleRate());
  fftLa = new FFT(La1.bufferSize(), La1.sampleRate());
  fftSi = new FFT(Si1.bufferSize(), Si1.sampleRate());
  
  // Tapered window important for log-domain display
  fftDo.window(FFT.HAMMING);
  fftRe.window(FFT.HAMMING);
  fftMi.window(FFT.HAMMING);
  fftFa.window(FFT.HAMMING);
  fftSol.window(FFT.HAMMING);
  fftLa.window(FFT.HAMMING);
  fftSi.window(FFT.HAMMING);
  
  elementos = new ArrayList(Arrays.asList(fftDo, fftRe, fftMi, fftFa, fftSol, fftLa, fftSi));
  elementos2 = new ArrayList(Arrays.asList(Do1, Re1, Mi1, Fa1, Sol1, La1, Si1));
}

void draw(){  
  
  if(state == 0){
    //menu
    textSize(64); text("PlayingPiano", 210, 135);
    fill(0); rect(200, 200, 400, 50); fill(255); textSize(36); text("Play", 363, 235);
    fill(0); rect(200, 300, 400, 50); fill(255); textSize(36); text("Tutoriais", 320, 335);
    fill(0); rect(200, 400, 400, 50); fill(255); textSize(36); text("Sobre", 350, 435);
    if (mousePressed && mouseX >= 200 && mouseX <= 600 && mouseY >= 200 && mouseY <= 250) {
      state = 1;
      println(state);
    }else if(mousePressed && mouseX >= 200 && mouseX <= 600 && mouseY >= 300 && mouseY <= 350){
      state = 2;
      println(state);
    }else if(mousePressed && mouseX >= 200 && mouseX <= 600 && mouseY >= 400 && mouseY <= 450){
      state = 3;
      println(state);
    }
  }else if(state == 1){
    background(222, 222, 222);
    teclas();
  }else if(state == 2){
    background(222, 222, 222);
    tutorial();
  }else if(state == 3){
    background(222, 222, 222);
    sobre();
  }
}

void audioVisualizer(){
  
  // perform a forward FFT on the samples in input buffer
  for (int i = 0; i < 7; i++) {
    FFT e = elementos.get(i);
    AudioPlayer e2 = elementos2.get(i);
    e.forward(e2.mix);
  }
  //fftDo.forward(Do.mix);
  //fftRe.forward(Re.mix);
  //fftMi.forward(Mi.mix);
  //fftFa.forward(Fa.mix);
  //fftSol.forward(Sol.mix);
  //fftLa.forward(La.mix);
  //fftSi.forward(Si.mix);


  noFill();
  for (FFT e : elementos) {
    for (int i = 0; i < e.specSize(); i++) {

    // draw the line for frequency band i using dB scale
    float val = dB_scale*(20*((float)Math.log10(e.getBand(i))) + gain);

    if (e.getBand(i) == 0) {   
      val = -200;
    }  // avoid log(0)

    int y = spectrum_height - Math.round(val);

    if (y > spectrum_height) { 
      y = spectrum_height;
    }

    float x1=legend_width+i+freqOffset;
    float y1=spectrum_height;
    float x2=x1;
    float y2=y;

    line(x1, y1, x2, y2);
    }
  }
}

void piano(){
 if (keyPressed) { if (key == 'q') { DoE(); } }
 if (keyPressed) { if (key == 'w') { ReE(); } }
 if (keyPressed) { if (key == 'e') { MiE(); } } 
 if (keyPressed) { if (key == 'r') { FaE(); } }
 if (keyPressed) { if (key == 't') { SolE();} } 
 if (keyPressed) { if (key == 'y') { LaE(); } }
 if (keyPressed) { if (key == 'u') { SiE(); } }
 if (keyPressed) { if (key == '2') { DoSE(); } }
 if (keyPressed) { if (key == '3') { ReSE(); } } 
 if (keyPressed) { if (key == '4') { FaSE(); } }
 if (keyPressed) { if (key == '5') { SolSE();} }
 if (keyPressed) { if (key == '6') { LaSE(); } }
 if (keyPressed) { if (key == 'v') { DoD(); } }
 if (keyPressed) { if (key == 'b') { ReD(); } }
 if (keyPressed) { if (key == 'n') { MiD(); } } 
 if (keyPressed) { if (key == 'm') { FaD(); } }
 if (keyPressed) { if (key == ',') { SolD();} }
 if (keyPressed) { if (key == '.') { LaD(); } }
 if (keyPressed) { if (key == ';') { SiD(); } }
 if (keyPressed) { if (key == 'h') { DoSD(); } }
 if (keyPressed) { if (key == 'j') { ReSD(); } }
 if (keyPressed) { if (key == 'k') { FaSD(); } }
 if (keyPressed) { if (key == 'l') { SolSD();} }
 if (keyPressed) { if (key == 'ç') { LaSD(); } }
}



void teclas() {
  audioVisualizer();
 
 //Oitava Esquerda
 fill(255);   rect(0,380, 40,120);  fill(0); textSize(12);  text("Dó", 10,485);
 fill(255);   rect(41,380,40,120);  fill(0); textSize(12);   text("Ré", 51,485);
 fill(255);   rect(82,380,40,120);  fill(0); textSize(12);   text("Mi", 92,485);
 fill(255);   rect(123,380,40,120);  fill(0); textSize(12);   text("Fá", 133,485);
 fill(255);   rect(164,380,40,120);  fill(0); textSize(12);  text("Sol", 174,485);
 fill(255);   rect(205,380,40,120);  fill(0); textSize(12);   text("Lá", 215,485);
 fill(255);   rect(246,380,40,120);  fill(0); textSize(12);   text("Si", 256,485);
 fill(0);   rect(25,380,30,70);  fill(255); textSize(12);   text("Dó#", 30,440);
 fill(0);   rect(66,380,30,70);  fill(255); textSize(12);   text("Ré#", 71,440);
 fill(0);   rect(148,380,30,70);  fill(255); textSize(12);   text("Fá#", 153,440);
 fill(0);   rect(189,380,30,70);  fill(255); textSize(12);   text("Sol#", 194,440);
 fill(0);   rect(230,380,30,70);  fill(255); textSize(12);   text("Lá#", 235,440);
 
 //Oitava Direita
 fill(255);   rect(287,380, 40,120);  fill(0); textSize(12);   text("Dó", 297,485);
 fill(255);   rect(328,380,40,120);  fill(0); textSize(12);   text("Ré", 338,485);
 fill(255);   rect(369,380,40,120);  fill(0); textSize(12);   text("Mi", 379,485);
 fill(255);   rect(410,380,40,120);  fill(0); textSize(12);   text("Fá", 420,485);
 fill(255);   rect(451,380,40,120);  fill(0); textSize(12);   text("Sol", 461,485);
 fill(255);   rect(492,380,40,120);  fill(0); textSize(12);   text("Lá", 502,485);
 fill(255);   rect(533,380,40,120);  fill(0); textSize(12);   text("Si", 543,485);
 fill(0);   rect(312,380,30,70);  fill(255); textSize(12);   text("Dó#", 317,440);
 fill(0);   rect(353,380,30,70);  fill(255); textSize(12);   text("Ré#", 358,440);
 fill(0);   rect(435,380,30,70);  fill(255); textSize(12);   text("Fá#", 440,440);
 fill(0);   rect(476,380,30,70);  fill(255); textSize(12);   text("Sol#", 481,440);
 fill(0);   rect(517,380,30,70);  fill(255); textSize(12);   text("Lá#", 522,440);
 
 piano();
}

//Preencher Oitavas Esquerdas
void DoE(){ fill(135);   rect(0,380, 40,120);  fill(0);  text("Dó", 10,485);}
void ReE(){ fill(135);   rect(41,380,40,120);  fill(0);  text("Ré", 51,485);}
void MiE(){ fill(135);   rect(82,380,40,120);  fill(0);  text("Mi", 92,485);}
void FaE(){ fill(135);   rect(123,380,40,120);  fill(0);  text("Fá", 133,485);}
void SolE(){ fill(135);   rect(164,380,40,120);  fill(0);  text("Sol", 174,485);}
void LaE(){ fill(135);   rect(205,380,40,120);  fill(0);  text("Lá", 215,485);}
void SiE(){ fill(135);   rect(246,380,40,120);  fill(0);  text("Si", 256,485);}
void DoSE(){ fill(135);   rect(25,380,30,70);  fill(0);  text("Dó#", 30,440);}
void ReSE(){ fill(135);   rect(66,380,30,70);  fill(0);  text("Ré#", 71,440);}
void FaSE(){ fill(135);   rect(148,380,30,70);  fill(0);  text("Fá#", 153,440);}
void SolSE(){ fill(135);   rect(189,380,30,70);  fill(0);  text("Sol#", 194,440);}
void LaSE(){ fill(135);   rect(230,380,30,70);  fill(0);  text("Lá#", 235,440);}

//Preencher Oitavas Direitas
void DoD(){ fill(135);   rect(287,380, 40,120);  fill(0);  text("Dó", 297,485);}
void ReD(){ fill(135);   rect(328,380,40,120);  fill(0);  text("Ré", 338,485);}
void MiD(){ fill(135);   rect(369,380,40,120);  fill(0);  text("Mi", 379,485);}
void FaD(){ fill(135);   rect(410,380,40,120);  fill(0);  text("Fá", 420,485);}
void SolD(){ fill(135);   rect(451,380,40,120);  fill(0);  text("Sol", 461,485);}
void LaD(){ fill(135);   rect(492,380,40,120);  fill(0);  text("Lá", 502,485);}
void SiD(){ fill(135);   rect(533,380,40,120);  fill(0);  text("Si", 543,485);}
void DoSD(){ fill(135);   rect(312,380,30,70);  fill(0);  text("Dó#", 317,440);}
void ReSD(){ fill(135);   rect(353,380,30,70);  fill(0);  text("Ré#", 358,440);}
void FaSD(){ fill(135);   rect(435,380,30,70);  fill(0);  text("Fá#", 440,440);}
void SolSD(){ fill(135);   rect(476,380,30,70);  fill(0);  text("Sol#", 481,440);}
void LaSD(){ fill(135);   rect(517,380,30,70);  fill(0);  text("Lá#", 522,440);}

boolean teste = true;

void keyPressed(){
  if (teste && key == 'q') {
   Do1.rewind();
   Do1.play(); 
   teste = false;
  }
  if (teste && key == 'w') {
   Re1.rewind();
   Re1.play();
   teste = false;
  }
  if (teste && key == 'e') {
   Mi1.rewind();
   Mi1.play();
   teste = false;
  }
  if (teste && key == 'r') {
   Fa1.rewind();
   Fa1.play();
   teste = false;
  }
  if (teste && key == 't') {
   Sol1.rewind();
   Sol1.play();
   teste = false;
  }
  if (teste && key == 'y') {
   La1.rewind();
   La1.play();
   teste = false;
  }
  if (teste && key == 'u') {
   Si1.rewind();
   Si1.play();
   teste = false;
  }
  if (teste && key == '2') {
   DoS1.rewind();
   DoS1.play();
   teste = false;
  }
  if (teste && key == '3') {
   ReS1.rewind();
   ReS1.play();
   teste = false;
  }
  if (teste && key == '4') {
   FaS1.rewind();
   FaS1.play();
   teste = false;
  }
  if (teste && key == '5') {
   SolS1.rewind();
   SolS1.play();
   teste = false;
  }
  if (teste && key == '6') {
   LaS1.rewind();
   LaS1.play();
   teste = false;
  }
  if (teste && key == 'v') {
   Do2.rewind();
   Do2.play();
   teste = false;
  }
  if (teste && key == 'b') {
   Re2.rewind();
   Re2.play();
   teste = false;
  }
  if (teste && key == 'n') {
   Mi2.rewind();
   Mi2.play();
   teste = false;
  }
  if (teste && key == 'm') {
   Fa2.rewind();
   Fa2.play();
   teste = false;
  }
  if (teste && key == ',') {
   Sol2.rewind();
   Sol2.play();
   teste = false;
  }
  if (teste && key == '.') {
   La2.rewind();
   La2.play();
   teste = false;
  }
  if (teste && key == ';') {
   Si2.rewind();
   Si2.play();
   teste = false;
  }
  if (teste && key == 'h') {
   DoS2.rewind();
   DoS2.play();
   teste = false;
  }
  if (teste && key == 'j') {
   ReS2.rewind();
   ReS2.play();
   teste = false;
  }
  if (teste && key == 'k') {
   FaS2.rewind();
   FaS2.play();
   teste = false;
  }
  if (teste && key == 'l') {
   SolS2.rewind();
   SolS2.play();
   teste = false;
  }
  if (teste && key == 'ç') {
   LaS2.rewind();
   LaS2.play();
   teste = false;
  }
}

void keyReleased() {
  teste = true; 
}

//Tutoriais
void tutorial(){
  
}

//Sobre
void sobre(){
  textAlign(CENTER);
  fill(0); textSize(64); text("Integrantes:", 400, 100);
  fill(0); textSize(28);  text("Henrique Marques da Silva de Oliveira", 400, 150);
  fill(0); textSize(28);  text("Lucas Fernando Assunção Cavalherie", 400, 200);
  fill(0); textSize(28);  text("Marco Vinicius Costódio Fellizzarro", 400, 250);
  fill(0); textSize(28);  text("Théo César Zanotto da Silva", 400, 300);
  fill(0); rect(300, 400, 200, 50); fill(255); textAlign(CENTER); textSize(36); text("Voltar", 400, 435);
}
