import java.util.Arrays;
import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioInput in;
FFT fftDo, fftRe, fftMi, fftFa, fftSol, fftLa, fftSi;
AudioPlayer Do, Re, Mi, Fa, Sol, La, Si;
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

void setup()
{
  size(800,500);
  //textFont(createFont("Georgia", 12));

  minim = new Minim(this);

  //in = minim.getLineIn(Minim.MONO,buffer_size,sample_rate);
  Do = minim.loadFile("/notes/28.mp3");
  Re = minim.loadFile("/notes/30.mp3");
  Mi = minim.loadFile("/notes/32.mp3");
  Fa = minim.loadFile("/notes/33.mp3");
  Sol = minim.loadFile("/notes/35.mp3");
  La = minim.loadFile("/notes/37.mp3");
  Si = minim.loadFile("/notes/39.mp3");
  // create an FFT object that has a time-domain buffer 
  // the same size as line-in's sample buffer
  fftDo = new FFT(Do.bufferSize(), Do.sampleRate());
  fftRe = new FFT(Re.bufferSize(), Re.sampleRate());
  fftMi = new FFT(Mi.bufferSize(), Mi.sampleRate());
  fftFa = new FFT(Fa.bufferSize(), Fa.sampleRate());
  fftSol = new FFT(Sol.bufferSize(), Sol.sampleRate());
  fftLa = new FFT(La.bufferSize(), La.sampleRate());
  fftSi = new FFT(Si.bufferSize(), Si.sampleRate());

  // Tapered window important for log-domain display
  fftDo.window(FFT.HAMMING);
  fftRe.window(FFT.HAMMING);
  fftMi.window(FFT.HAMMING);
  fftFa.window(FFT.HAMMING);
  fftSol.window(FFT.HAMMING);
  fftLa.window(FFT.HAMMING);
  fftSi.window(FFT.HAMMING);
  
  elementos = new ArrayList(Arrays.asList(fftDo, fftRe, fftMi, fftFa, fftSol, fftLa, fftSi));
  elementos2 = new ArrayList(Arrays.asList(Do, Re, Mi, Fa, Sol, La, Si));

}


void draw()
{
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
  // clear window
  background(0);

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

  // now draw current spectrum in brighter blue
  stroke(64, 255, 255);
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
