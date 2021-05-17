import java.util.Arrays;
import ddf.minim.analysis.*;
import ddf.minim.*;
Minim minim;
AudioInput in;
FFT fftDo1, fftRe1, fftMi1, fftFa1, fftSol1, fftLa1, fftSi1, fftDoS1, fftReS1, fftFaS1, fftSolS1, fftLaS1,
fftDo2, fftRe2, fftMi2, fftFa2, fftSol2, fftLa2, fftSi2, fftDoS2, fftReS2, fftFaS2, fftSolS2, fftLaS2,
fftDo3, fftRe3, fftMi3, fftFa3, fftSol3, fftLa3, fftSi3, fftDoS3, fftReS3, fftFaS3, fftSolS3, fftLaS3,
fftDo4, fftRe4, fftMi4, fftFa4, fftSol4, fftLa4, fftSi4, fftDoS4, fftReS4, fftFaS4, fftSolS4, fftLaS4,
fftDo5, fftRe5, fftMi5, fftFa5, fftSol5, fftLa5, fftSi5, fftDoS5, fftReS5, fftFaS5, fftSolS5, fftLaS5,
fftDo6, fftRe6, fftMi6, fftFa6, fftSol6, fftLa6, fftSi6, fftDoS6, fftReS6, fftFaS6, fftSolS6, fftLaS6,
fftDo7, fftRe7, fftMi7, fftFa7, fftSol7, fftLa7, fftSi7, fftDoS7, fftReS7, fftFaS7, fftSolS7, fftLaS7,
fftDo8, fftRe8, fftMi8, fftFa8, fftSol8, fftLa8, fftSi8, fftDoS8, fftReS8, fftFaS8, fftSolS8, fftLaS8;

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
float dB_scale = 7.0;  // pixels per dB
int buffer_size = 1024;  // also sets FFT size (frequency resolution)
float sample_rate = 44100;

int spectrum_height = 200; // determines range of dB shown
int legend_height = 20;
int spectrum_width = 1012; // determines how much of spectrum we see
int legend_width = 60;
int freqOffset = 10;

final color colSelected=color(0);
final color colPlain=color(0);

int state = 0;
int GrupoOitavas = 1;

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
 
  fftDo1 = new FFT(Do1.bufferSize(), Do1.sampleRate());
  fftRe1 = new FFT(Re1.bufferSize(), Re1.sampleRate());
  fftMi1 = new FFT(Mi1.bufferSize(), Mi1.sampleRate());
  fftFa1 = new FFT(Fa1.bufferSize(), Fa1.sampleRate());
  fftSol1 = new FFT(Sol1.bufferSize(), Sol1.sampleRate());
  fftLa1 = new FFT(La1.bufferSize(), La1.sampleRate());
  fftSi1 = new FFT(Si1.bufferSize(), Si1.sampleRate());
  fftDoS1 = new FFT(DoS1.bufferSize(), DoS1.sampleRate());
  fftReS1 = new FFT(ReS1.bufferSize(), ReS1.sampleRate());
  fftFaS1 = new FFT(FaS1.bufferSize(), FaS1.sampleRate());
  fftSolS1 = new FFT(SolS1.bufferSize(), SolS1.sampleRate());
  fftLaS1 = new FFT(LaS1.bufferSize(), LaS1.sampleRate());
  fftDo2 = new FFT(Do2.bufferSize(), Do2.sampleRate());
  fftRe2 = new FFT(Re2.bufferSize(), Re2.sampleRate());
  fftMi2 = new FFT(Mi2.bufferSize(), Mi2.sampleRate());
  fftFa2 = new FFT(Fa2.bufferSize(), Fa2.sampleRate());
  fftSol2 = new FFT(Sol2.bufferSize(), Sol2.sampleRate());
  fftLa2 = new FFT(La2.bufferSize(), La2.sampleRate());
  fftSi2 = new FFT(Si2.bufferSize(), Si2.sampleRate());
  fftDoS2 = new FFT(DoS2.bufferSize(), DoS2.sampleRate());
  fftReS2 = new FFT(ReS2.bufferSize(), ReS2.sampleRate());
  fftFaS2 = new FFT(FaS2.bufferSize(), FaS2.sampleRate());
  fftSolS2 = new FFT(SolS2.bufferSize(), SolS2.sampleRate());
  fftLaS2 = new FFT(LaS2.bufferSize(), LaS2.sampleRate());
  fftDo3 = new FFT(Do3.bufferSize(), Do3.sampleRate());
  fftRe3 = new FFT(Re3.bufferSize(), Re3.sampleRate());
  fftMi3 = new FFT(Mi3.bufferSize(), Mi3.sampleRate());
  fftFa3 = new FFT(Fa3.bufferSize(), Fa3.sampleRate());
  fftSol3 = new FFT(Sol3.bufferSize(), Sol3.sampleRate());
  fftLa3 = new FFT(La3.bufferSize(), La3.sampleRate());
  fftSi3 = new FFT(Si3.bufferSize(), Si3.sampleRate());
  fftDoS3 = new FFT(DoS3.bufferSize(), DoS3.sampleRate());
  fftReS3 = new FFT(ReS3.bufferSize(), ReS3.sampleRate());
  fftFaS3 = new FFT(FaS3.bufferSize(), FaS3.sampleRate());
  fftSolS3 = new FFT(SolS3.bufferSize(), SolS3.sampleRate());
  fftLaS3 = new FFT(LaS3.bufferSize(), LaS3.sampleRate());
  fftDo4 = new FFT(Do4.bufferSize(), Do4.sampleRate());
  fftRe4 = new FFT(Re4.bufferSize(), Re4.sampleRate());
  fftMi4 = new FFT(Mi4.bufferSize(), Mi4.sampleRate());
  fftFa4 = new FFT(Fa4.bufferSize(), Fa4.sampleRate());
  fftSol4 = new FFT(Sol4.bufferSize(), Sol4.sampleRate());
  fftLa4 = new FFT(La4.bufferSize(), La4.sampleRate());
  fftSi4 = new FFT(Si4.bufferSize(), Si4.sampleRate());
  fftDoS4 = new FFT(DoS4.bufferSize(), DoS4.sampleRate());
  fftReS4 = new FFT(ReS4.bufferSize(), ReS4.sampleRate());
  fftFaS4 = new FFT(FaS4.bufferSize(), FaS4.sampleRate());
  fftSolS4 = new FFT(SolS4.bufferSize(), SolS4.sampleRate());
  fftLaS4 = new FFT(LaS4.bufferSize(), LaS4.sampleRate());
  fftDo5 = new FFT(Do5.bufferSize(), Do5.sampleRate());
  fftRe5 = new FFT(Re5.bufferSize(), Re5.sampleRate());
  fftMi5 = new FFT(Mi5.bufferSize(), Mi5.sampleRate());
  fftFa5 = new FFT(Fa5.bufferSize(), Fa5.sampleRate());
  fftSol5 = new FFT(Sol5.bufferSize(), Sol5.sampleRate());
  fftLa5 = new FFT(La5.bufferSize(), La5.sampleRate());
  fftSi5 = new FFT(Si5.bufferSize(), Si5.sampleRate());
  fftDoS5 = new FFT(DoS5.bufferSize(), DoS5.sampleRate());
  fftReS5 = new FFT(ReS5.bufferSize(), ReS5.sampleRate());
  fftFaS5 = new FFT(FaS5.bufferSize(), FaS5.sampleRate());
  fftSolS5 = new FFT(SolS5.bufferSize(), SolS5.sampleRate());
  fftLaS5 = new FFT(LaS5.bufferSize(), LaS5.sampleRate());
  fftDo6 = new FFT(Do6.bufferSize(), Do6.sampleRate());
  fftRe6 = new FFT(Re6.bufferSize(), Re6.sampleRate());
  fftMi6 = new FFT(Mi6.bufferSize(), Mi6.sampleRate());
  fftFa6 = new FFT(Fa6.bufferSize(), Fa6.sampleRate());
  fftSol6 = new FFT(Sol6.bufferSize(), Sol6.sampleRate());
  fftLa6 = new FFT(La6.bufferSize(), La6.sampleRate());
  fftSi6 = new FFT(Si6.bufferSize(), Si6.sampleRate());
  fftDoS6 = new FFT(DoS6.bufferSize(), DoS6.sampleRate());
  fftReS6 = new FFT(ReS6.bufferSize(), ReS6.sampleRate());
  fftFaS6 = new FFT(FaS6.bufferSize(), FaS6.sampleRate());
  fftSolS6 = new FFT(SolS6.bufferSize(), SolS6.sampleRate());
  fftLaS6 = new FFT(LaS6.bufferSize(), LaS6.sampleRate());
  fftDo7 = new FFT(Do7.bufferSize(), Do7.sampleRate());
  fftRe7 = new FFT(Re7.bufferSize(), Re7.sampleRate());
  fftMi7 = new FFT(Mi7.bufferSize(), Mi7.sampleRate());
  fftFa7 = new FFT(Fa7.bufferSize(), Fa7.sampleRate());
  fftSol7 = new FFT(Sol7.bufferSize(), Sol7.sampleRate());
  fftLa7 = new FFT(La7.bufferSize(), La7.sampleRate());
  fftSi7 = new FFT(Si7.bufferSize(), Si7.sampleRate());
  fftDoS7 = new FFT(DoS7.bufferSize(), DoS7.sampleRate());
  fftReS7 = new FFT(ReS7.bufferSize(), ReS7.sampleRate());
  fftFaS7 = new FFT(FaS7.bufferSize(), FaS7.sampleRate());
  fftSolS7 = new FFT(SolS7.bufferSize(), SolS7.sampleRate());
  fftLaS7 = new FFT(LaS7.bufferSize(), LaS7.sampleRate());
  fftDo8 = new FFT(Do8.bufferSize(), Do8.sampleRate());
  fftRe8 = new FFT(Re8.bufferSize(), Re8.sampleRate());
  fftMi8 = new FFT(Mi8.bufferSize(), Mi8.sampleRate());
  fftFa8 = new FFT(Fa8.bufferSize(), Fa8.sampleRate());
  fftSol8 = new FFT(Sol8.bufferSize(), Sol8.sampleRate());
  fftLa8 = new FFT(La8.bufferSize(), La8.sampleRate());
  fftSi8 = new FFT(Si8.bufferSize(), Si8.sampleRate());
  fftDoS8 = new FFT(DoS8.bufferSize(), DoS8.sampleRate());
  fftReS8 = new FFT(ReS8.bufferSize(), ReS8.sampleRate());
  fftFaS8 = new FFT(FaS8.bufferSize(), FaS8.sampleRate());
  fftSolS8 = new FFT(SolS8.bufferSize(), SolS8.sampleRate());
  fftLaS8 = new FFT(LaS8.bufferSize(), LaS8.sampleRate());
  
  // Tapered window important for log-domain display
  fftDo1.window(FFT.HAMMING);
  fftRe1.window(FFT.HAMMING);
  fftMi1.window(FFT.HAMMING);
  fftFa1.window(FFT.HAMMING);
  fftSol1.window(FFT.HAMMING);
  fftLa1.window(FFT.HAMMING);
  fftSi1.window(FFT.HAMMING);
  fftDoS1.window(FFT.HAMMING);
  fftReS1.window(FFT.HAMMING);
  fftFaS1.window(FFT.HAMMING);
  fftSolS1.window(FFT.HAMMING);
  fftLaS1.window(FFT.HAMMING);
  fftDo2.window(FFT.HAMMING);
  fftRe2.window(FFT.HAMMING);
  fftMi2.window(FFT.HAMMING);
  fftFa2.window(FFT.HAMMING);
  fftSol2.window(FFT.HAMMING);
  fftLa2.window(FFT.HAMMING);
  fftSi2.window(FFT.HAMMING);
  fftDoS2.window(FFT.HAMMING);
  fftReS2.window(FFT.HAMMING);
  fftFaS2.window(FFT.HAMMING);
  fftSolS2.window(FFT.HAMMING);
  fftLaS2.window(FFT.HAMMING);
  fftDo3.window(FFT.HAMMING);
  fftRe3.window(FFT.HAMMING);
  fftMi3.window(FFT.HAMMING);
  fftFa3.window(FFT.HAMMING);
  fftSol3.window(FFT.HAMMING);
  fftLa3.window(FFT.HAMMING);
  fftSi3.window(FFT.HAMMING);
  fftDoS3.window(FFT.HAMMING);
  fftReS3.window(FFT.HAMMING);
  fftFaS3.window(FFT.HAMMING);
  fftSolS3.window(FFT.HAMMING);
  fftLaS3.window(FFT.HAMMING);
  fftDo4.window(FFT.HAMMING);
  fftRe4.window(FFT.HAMMING);
  fftMi4.window(FFT.HAMMING);
  fftFa4.window(FFT.HAMMING);
  fftSol4.window(FFT.HAMMING);
  fftLa4.window(FFT.HAMMING);
  fftSi4.window(FFT.HAMMING);
  fftDoS4.window(FFT.HAMMING);
  fftReS4.window(FFT.HAMMING);
  fftFaS4.window(FFT.HAMMING);
  fftSolS4.window(FFT.HAMMING);
  fftLaS4.window(FFT.HAMMING);
  fftDo5.window(FFT.HAMMING);
  fftRe5.window(FFT.HAMMING);
  fftMi5.window(FFT.HAMMING);
  fftFa5.window(FFT.HAMMING);
  fftSol5.window(FFT.HAMMING);
  fftLa5.window(FFT.HAMMING);
  fftSi5.window(FFT.HAMMING);
  fftDoS5.window(FFT.HAMMING);
  fftReS5.window(FFT.HAMMING);
  fftFaS5.window(FFT.HAMMING);
  fftSolS5.window(FFT.HAMMING);
  fftLaS5.window(FFT.HAMMING);
  fftDo6.window(FFT.HAMMING);
  fftRe6.window(FFT.HAMMING);
  fftMi6.window(FFT.HAMMING);
  fftFa6.window(FFT.HAMMING);
  fftSol6.window(FFT.HAMMING);
  fftLa6.window(FFT.HAMMING);
  fftSi6.window(FFT.HAMMING);
  fftDoS6.window(FFT.HAMMING);
  fftReS6.window(FFT.HAMMING);
  fftFaS6.window(FFT.HAMMING);
  fftSolS6.window(FFT.HAMMING);
  fftLaS6.window(FFT.HAMMING);
  fftDo7.window(FFT.HAMMING);
  fftRe7.window(FFT.HAMMING);
  fftMi7.window(FFT.HAMMING);
  fftFa7.window(FFT.HAMMING);
  fftSol7.window(FFT.HAMMING);
  fftLa7.window(FFT.HAMMING);
  fftSi7.window(FFT.HAMMING);
  fftDoS7.window(FFT.HAMMING);
  fftReS7.window(FFT.HAMMING);
  fftFaS7.window(FFT.HAMMING);
  fftSolS7.window(FFT.HAMMING);
  fftLaS7.window(FFT.HAMMING);
  fftDo8.window(FFT.HAMMING);
  fftRe8.window(FFT.HAMMING);
  fftMi8.window(FFT.HAMMING);
  fftFa8.window(FFT.HAMMING);
  fftSol8.window(FFT.HAMMING);
  fftLa8.window(FFT.HAMMING);
  fftSi8.window(FFT.HAMMING);
  fftDoS8.window(FFT.HAMMING);
  fftReS8.window(FFT.HAMMING);
  fftFaS8.window(FFT.HAMMING);
  fftSolS8.window(FFT.HAMMING);
  fftLaS8.window(FFT.HAMMING);
  
  elementos = new ArrayList(Arrays.asList(fftDo1, fftRe1, fftMi1, fftFa1, fftSol1, fftLa1, fftSi1, fftDoS1, fftReS1, fftFaS1, fftSolS1, fftLaS1,
fftDo2, fftRe2, fftMi2, fftFa2, fftSol2, fftLa2, fftSi2, fftDoS2, fftReS2, fftFaS2, fftSolS2, fftLaS2,
fftDo3, fftRe3, fftMi3, fftFa3, fftSol3, fftLa3, fftSi3, fftDoS3, fftReS3, fftFaS3, fftSolS3, fftLaS3,
fftDo4, fftRe4, fftMi4, fftFa4, fftSol4, fftLa4, fftSi4, fftDoS4, fftReS4, fftFaS4, fftSolS4, fftLaS4,
fftDo5, fftRe5, fftMi5, fftFa5, fftSol5, fftLa5, fftSi5, fftDoS5, fftReS5, fftFaS5, fftSolS5, fftLaS5,
fftDo6, fftRe6, fftMi6, fftFa6, fftSol6, fftLa6, fftSi6, fftDoS6, fftReS6, fftFaS6, fftSolS6, fftLaS6,
fftDo7, fftRe7, fftMi7, fftFa7, fftSol7, fftLa7, fftSi7, fftDoS7, fftReS7, fftFaS7, fftSolS7, fftLaS7,
fftDo8, fftRe8, fftMi8, fftFa8, fftSol8, fftLa8, fftSi8, fftDoS8, fftReS8, fftFaS8, fftSolS8, fftLaS8));
  elementos2 = new ArrayList(Arrays.asList(Do1, Re1, Mi1, Fa1, Sol1, La1, Si1, Do2, Re2, Mi2, Fa2, Sol2, La2, Si2,
Do3, Re3, Mi3, Fa3, Sol3, La3, Si3, Do4, Re4, Mi4, Fa4, Sol4, La4, Si4,
Do5, Re5, Mi5, Fa5, Sol5, La5, Si5, Do6, Re6, Mi6, Fa6, Sol6, La6, Si6,
Do7, Re7, Mi7, Fa7, Sol7, La7, Si7, Do8, Re8, Mi8, Fa8, Sol8, La8, Si8,
DoS1, ReS1, FaS1, SolS1, LaS1, DoS2, ReS2, FaS2, SolS2, LaS2, 
DoS3, ReS3, FaS3, SolS3, LaS3, DoS4, ReS4, FaS4, SolS4, LaS4,
DoS5, ReS5, FaS5, SolS5, LaS5, DoS6, ReS6, FaS6, SolS6, LaS6,
DoS7, ReS7, FaS7, SolS7, LaS7, DoS8, ReS8, FaS8, SolS8, LaS8));
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
  for (int i = 0; i < 96; i++) {
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
 if (keyPressed) { if (key == 'q'||key == 'Q') { DoE(); } }
 if (keyPressed) { if (key == 'w'||key == 'W') { ReE(); } }
 if (keyPressed) { if (key == 'e'||key == 'E') { MiE(); } } 
 if (keyPressed) { if (key == 'r'||key == 'R') { FaE(); } }
 if (keyPressed) { if (key == 't'||key == 'T') { SolE();} } 
 if (keyPressed) { if (key == 'y'||key == 'Y') { LaE(); } }
 if (keyPressed) { if (key == 'u'||key == 'U') { SiE(); } }
 if (keyPressed) { if (key == '2') { DoSE(); } }
 if (keyPressed) { if (key == '3') { ReSE(); } } 
 if (keyPressed) { if (key == '4') { FaSE(); } }
 if (keyPressed) { if (key == '5') { SolSE();} }
 if (keyPressed) { if (key == '6') { LaSE(); } }
 if (keyPressed) { if (key == 'v'||key == 'V') { DoD(); } }
 if (keyPressed) { if (key == 'b'||key == 'B') { ReD(); } }
 if (keyPressed) { if (key == 'n'||key == 'N') { MiD(); } } 
 if (keyPressed) { if (key == 'm'||key == 'M') { FaD(); } }
 if (keyPressed) { if (key == ',') { SolD();} }
 if (keyPressed) { if (key == '.') { LaD(); } }
 if (keyPressed) { if (key == ';') { SiD(); } }
 if (keyPressed) { if (key == 'h'||key == 'H') { DoSD(); } }
 if (keyPressed) { if (key == 'j'||key == 'J') { ReSD(); } }
 if (keyPressed) { if (key == 'k'||key == 'K') { FaSD(); } }
 if (keyPressed) { if (key == 'l'||key == 'L') { SolSD();} }
 if (keyPressed) { if (key == 'ç'||key == 'Ç') { LaSD(); } }
 //Trocar páginas
 if (keyPressed) { if (key == 'x'||key == 'X') { state = 2; } }
 if (keyPressed) { if (key == 'c'||key == 'C') { state = 3; } }
}



void teclas() {
  audioVisualizer();
  textAlign(LEFT);
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
 // Trocar Oitava
 if (GrupoOitavas == 1){
   fill(0); rect(634,385,50,50); fill(255); text("1 e 2",645,415);
   fill(135); rect(689,385,50,50); fill(0); text("3 e 4",700,415);
   fill(135); rect(634,440,50,50); fill(0); text("5 e 6",645,470);
   fill(135); rect(689,440,50,50); fill(0); text("7 e 8",700,470);
  }
 if (GrupoOitavas == 2){
   fill(135); rect(634,385,50,50); fill(0); text("1 e 2",645,415);
   fill(0); rect(689,385,50,50); fill(255); text("3 e 4",700,415);
   fill(135); rect(634,440,50,50); fill(0); text("5 e 6",645,470);
   fill(135); rect(689,440,50,50); fill(0); text("7 e 8",700,470);
  }
 if (GrupoOitavas == 3){
   fill(135); rect(634,385,50,50); fill(0); text("1 e 2",645,415);
   fill(135); rect(689,385,50,50); fill(0); text("3 e 4",700,415);
   fill(0); rect(634,440,50,50); fill(255); text("5 e 6",645,470);
   fill(135); rect(689,440,50,50); fill(0); text("7 e 8",700,470);
  }
 if (GrupoOitavas == 4){
   fill(135); rect(634,385,50,50); fill(0); text("1 e 2",645,415);
   fill(135); rect(689,385,50,50); fill(0); text("3 e 4",700,415);
   fill(135); rect(634,440,50,50); fill(0); text("5 e 6",645,470);
   fill(0); rect(689,440,50,50); fill(255); text("7 e 8",700,470);
  }
 
 piano();
 
 textAlign(CENTER);
  fill(0); textSize(28);  text("'X' para ir para a página de tutorial", 400, 275);
  fill(0); textSize(28);  text("'C' para ir para a página sobre", 400, 325);
}

//Preencher Oitavas Esquerdas
void DoE(){
 fill(135);   rect(0,450, 40,50);  strokeWeight(0);  fill(135);   rect(0,380, 25,120);  fill(0);  text("Dó", 10,485);
}

void ReE(){
 fill(135);   rect(41,450,40,50);  strokeWeight(0);  fill(135);   rect(55,380,11,120);  fill(0);  text("Ré", 51,485);
}

void MiE(){
 fill(135);   rect(82,450,40,50);  strokeWeight(0);  fill(135);   rect(96,380,26,120);  fill(0);  text("Mi", 92,485);
}

void FaE(){
 fill(135);   rect(123,450,40,50);  strokeWeight(0);  fill(135);   rect(123,380,25,120);  fill(0);  text("Fá", 133,485);
}

void SolE(){
 fill(135);   rect(164,450,40,50);  strokeWeight(0);  fill(135);   rect(178,380,11,120);  fill(0);  text("Sol", 174,485);
}

void LaE(){
 fill(135);   rect(205,450,40,50);  strokeWeight(0);  fill(135);   rect(219,380,11,120);  fill(0);  text("Lá", 215,485);
}

void SiE(){
 fill(135);   rect(246,450,40,50);  strokeWeight(0);  fill(135);   rect(260,380,26,120);  fill(0);  text("Si", 256,485);  
}

void DoSE(){
 fill(135);   rect(25,380,30,70);  fill(0);  text("Dó#", 30,440);
}

void ReSE(){
 fill(135);   rect(66,380,30,70);  fill(0);  text("Ré#", 71,440);
}

void FaSE(){
 fill(135);   rect(148,380,30,70);  fill(0);  text("Fá#", 153,440);
}

void SolSE(){
 fill(135);   rect(189,380,30,70);  fill(0);  text("Sol#", 194,440);
}

void LaSE(){
 fill(135);   rect(230,380,30,70);  fill(0);  text("Lá#", 235,440);
}

//Preencher Oitavas Direitas
void DoD(){
 fill(135);   rect(287,450,40,50);  strokeWeight(0);  fill(135);   rect(287,380,25,120);  fill(0);  text("Dó", 297,485);
}

void ReD(){
 fill(135);   rect(328,450,40,50);  strokeWeight(0);  fill(135);   rect(342,380,11,120);  fill(0);  text("Ré", 338,485);
}

void MiD(){
 fill(135);   rect(369,450,40,50);  strokeWeight(0);  fill(135);   rect(383,380,26,120);  fill(0);  text("Mi", 379,485);
}

void FaD(){
 fill(135);   rect(410,450,40,50);  strokeWeight(0);  fill(135);   rect(410,380,25,120);  fill(0);  text("Fá", 420,485);
}

void SolD(){
 fill(135);   rect(451,450,40,50);  strokeWeight(0);  fill(135);   rect(465,380,11,120);  fill(0);  text("Sol", 461,485);
}

void LaD(){
 fill(135);   rect(492,450,40,50);  strokeWeight(0);  fill(135);   rect(506,380,11,120);  fill(0);  text("Lá", 502,485);
}

void SiD(){
 fill(135);   rect(533,450,40,50);  strokeWeight(0);  fill(135);   rect(547,380,26,120);  fill(0);  text("Si", 543,485);  
}

void DoSD(){
 fill(135);   rect(312,380,30,70);  fill(0);  text("Dó#", 317,440);
}

void ReSD(){
 fill(135);   rect(353,380,30,70);  fill(0);  text("Ré#", 358,440);
}

void FaSD(){
 fill(135);   rect(435,380,30,70);  fill(0);  text("Fá#", 440,440);
}

void SolSD(){
 fill(135);   rect(476,380,30,70);  fill(0);  text("Sol#", 481,440);
}

void LaSD(){
 fill(135);   rect(517,380,30,70);  fill(0);  text("Lá#", 522,440);
}

boolean teste = true;

void keyPressed(){
//notas
//Primeiro Grupo
if (GrupoOitavas == 1){
  if (teste && key == 'q'|| teste && key == 'Q') {
   Do1.rewind();
   Do1.play();
   teste = false;
  }
  if (teste && key == 'w'|| teste && key == 'W') {
   Re1.rewind();
   Re1.play();
   teste = false;
  }
  if (teste && key == 'e'|| teste && key == 'E') {
   Mi1.rewind();
   Mi1.play();
   teste = false;
  }
  if (teste && key == 'r'|| teste && key == 'R') {
   Fa1.rewind();
   Fa1.play();
   teste = false;
  }
  if (teste && key == 't'|| teste && key == 'T') {
   Sol1.rewind();
   Sol1.play();
   teste = false;
  }
  if (teste && key == 'y'|| teste && key == 'Y') {
   La1.rewind();
   La1.play();
   teste = false;
  }
  if (teste && key == 'u'|| teste && key == 'U') {
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
  if (teste && key == 'v'|| teste && key == 'V') {
   Do2.rewind();
   Do2.play();
   teste = false;
  }
  if (teste && key == 'b'|| teste && key == 'B') {
   Re2.rewind();
   Re2.play();
   teste = false;
  }
  if (teste && key == 'n'|| teste && key == 'N') {
   Mi2.rewind();
   Mi2.play();
   teste = false;
  }
  if (teste && key == 'm'|| teste && key == 'M') {
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
  if (teste && key == 'h'|| teste && key == 'H') {
   DoS2.rewind();
   DoS2.play();
   teste = false;
  }
  if (teste && key == 'j'|| teste && key == 'J') {
   ReS2.rewind();
   ReS2.play();
   teste = false;
  }
  if (teste && key == 'k'|| teste && key == 'K') {
   FaS2.rewind();
   FaS2.play();
   teste = false;
  }
  if (teste && key == 'l'|| teste && key == 'L') {
   SolS2.rewind();
   SolS2.play();
   teste = false;
  }
  if (teste && key == 'ç'|| teste && key == 'Ç') {
   LaS2.rewind();
   LaS2.play();
   teste = false;
  }
}
//SegundoGrupo
if (GrupoOitavas == 2){
  if (teste && key == 'q'|| teste && key == 'Q') {
   Do3.rewind();
   Do3.play();
   teste = false;
  }
  if (teste && key == 'w'|| teste && key == 'W') {
   Re3.rewind();
   Re3.play();
   teste = false;
  }
  if (teste && key == 'e'|| teste && key == 'E') {
   Mi3.rewind();
   Mi3.play();
   teste = false;
  }
  if (teste && key == 'r'|| teste && key == 'R') {
   Fa3.rewind();
   Fa3.play();
   teste = false;
  }
  if (teste && key == 't'|| teste && key == 'T') {
   Sol3.rewind();
   Sol3.play();
   teste = false;
  }
  if (teste && key == 'y'|| teste && key == 'Y') {
   La3.rewind();
   La3.play();
   teste = false;
  }
  if (teste && key == 'u'|| teste && key == 'U') {
   Si3.rewind();
   Si3.play();
   teste = false;
  }
  if (teste && key == '2') {
   DoS3.rewind();
   DoS3.play();
   teste = false;
  }
  if (teste && key == '3') {
   ReS3.rewind();
   ReS3.play();
   teste = false;
  }
  if (teste && key == '4') {
   FaS3.rewind();
   FaS3.play();
   teste = false;
  }
  if (teste && key == '5') {
   SolS3.rewind();
   SolS3.play();
   teste = false;
  }
  if (teste && key == '6') {
   LaS3.rewind();
   LaS3.play();
   teste = false;
  }
  if (teste && key == 'v'|| teste && key == 'V') {
   Do4.rewind();
   Do4.play();
   teste = false;
  }
  if (teste && key == 'b'|| teste && key == 'B') {
   Re4.rewind();
   Re4.play();
   teste = false;
  }
  if (teste && key == 'n'|| teste && key == 'N') {
   Mi4.rewind();
   Mi4.play();
   teste = false;
  }
  if (teste && key == 'm'|| teste && key == 'M') {
   Fa4.rewind();
   Fa4.play();
   teste = false;
  }
  if (teste && key == ',') {
   Sol4.rewind();
   Sol4.play();
   teste = false;
  }
  if (teste && key == '.') {
   La4.rewind();
   La4.play();
   teste = false;
  }
  if (teste && key == ';') {
   Si4.rewind();
   Si4.play();
   teste = false;
  }
  if (teste && key == 'h'|| teste && key == 'H') {
   DoS4.rewind();
   DoS4.play();
   teste = false;
  }
  if (teste && key == 'j'|| teste && key == 'J') {
   ReS4.rewind();
   ReS4.play();
   teste = false;
  }
  if (teste && key == 'k'|| teste && key == 'K') {
   FaS4.rewind();
   FaS4.play();
   teste = false;
  }
  if (teste && key == 'l'|| teste && key == 'L') {
   SolS4.rewind();
   SolS4.play();
   teste = false;
  }
  if (teste && key == 'ç'|| teste && key == 'Ç') {
   LaS4.rewind();
   LaS4.play();
   teste = false;
  }
}
//Terceiro Grupo
if (GrupoOitavas == 3){
  if (teste && key == 'q'|| teste && key == 'Q') {
   Do5.rewind();
   Do5.play();
   teste = false;
  }
  if (teste && key == 'w'|| teste && key == 'W') {
   Re5.rewind();
   Re5.play();
   teste = false;
  }
  if (teste && key == 'e'|| teste && key == 'E') {
   Mi5.rewind();
   Mi5.play();
   teste = false;
  }
  if (teste && key == 'r'|| teste && key == 'R') {
   Fa5.rewind();
   Fa5.play();
   teste = false;
  }
  if (teste && key == 't'|| teste && key == 'T') {
   Sol5.rewind();
   Sol5.play();
   teste = false;
  }
  if (teste && key == 'y'|| teste && key == 'Y') {
   La5.rewind();
   La5.play();
   teste = false;
  }
  if (teste && key == 'u'|| teste && key == 'U') {
   Si5.rewind();
   Si5.play();
   teste = false;
  }
  if (teste && key == '2') {
   DoS5.rewind();
   DoS5.play();
   teste = false;
  }
  if (teste && key == '3') {
   ReS5.rewind();
   ReS5.play();
   teste = false;
  }
  if (teste && key == '4') {
   FaS5.rewind();
   FaS5.play();
   teste = false;
  }
  if (teste && key == '5') {
   SolS5.rewind();
   SolS5.play();
   teste = false;
  }
  if (teste && key == '6') {
   LaS5.rewind();
   LaS5.play();
   teste = false;
  }
  if (teste && key == 'v'|| teste && key == 'V') {
   Do6.rewind();
   Do6.play();
   teste = false;
  }
  if (teste && key == 'b'|| teste && key == 'B') {
   Re6.rewind();
   Re6.play();
   teste = false;
  }
  if (teste && key == 'n'|| teste && key == 'N') {
   Mi6.rewind();
   Mi6.play();
   teste = false;
  }
  if (teste && key == 'm'|| teste && key == 'M') {
   Fa6.rewind();
   Fa6.play();
   teste = false;
  }
  if (teste && key == ',') {
   Sol6.rewind();
   Sol6.play();
   teste = false;
  }
  if (teste && key == '.') {
   La6.rewind();
   La6.play();
   teste = false;
  }
  if (teste && key == ';') {
   Si6.rewind();
   Si6.play();
   teste = false;
  }
  if (teste && key == 'h'|| teste && key == 'H') {
   DoS6.rewind();
   DoS6.play();
   teste = false;
  }
  if (teste && key == 'j'|| teste && key == 'J') {
   ReS6.rewind();
   ReS6.play();
   teste = false;
  }
  if (teste && key == 'k'|| teste && key == 'K') {
   FaS6.rewind();
   FaS6.play();
   teste = false;
  }
  if (teste && key == 'l'|| teste && key == 'L') {
   SolS6.rewind();
   SolS6.play();
   teste = false;
  }
  if (teste && key == 'ç'|| teste && key == 'Ç') {
   LaS6.rewind();
   LaS6.play();
   teste = false;
  }
}
//Quarto Grupo
if (GrupoOitavas == 4){
  if (teste && key == 'q'|| teste && key == 'Q') {
   Do7.rewind();
   Do7.play();
   teste = false;
  }
  if (teste && key == 'w'|| teste && key == 'W') {
   Re7.rewind();
   Re7.play();
   teste = false;
  }
  if (teste && key == 'e'|| teste && key == 'E') {
   Mi7.rewind();
   Mi7.play();
   teste = false;
  }
  if (teste && key == 'r'|| teste && key == 'R') {
   Fa7.rewind();
   Fa7.play();
   teste = false;
  }
  if (teste && key == 't'|| teste && key == 'T') {
   Sol7.rewind();
   Sol7.play();
   teste = false;
  }
  if (teste && key == 'y'|| teste && key == 'Y') {
   La7.rewind();
   La7.play();
   teste = false;
  }
  if (teste && key == 'u'|| teste && key == 'U') {
   Si7.rewind();
   Si7.play();
   teste = false;
  }
  if (teste && key == '2') {
   DoS7.rewind();
   DoS7.play();
   teste = false;
  }
  if (teste && key == '3') {
   ReS7.rewind();
   ReS7.play();
   teste = false;
  }
  if (teste && key == '4') {
   FaS7.rewind();
   FaS7.play();
   teste = false;
  }
  if (teste && key == '5') {
   SolS7.rewind();
   SolS7.play();
   teste = false;
  }
  if (teste && key == '6') {
   LaS7.rewind();
   LaS7.play();
   teste = false;
  }
  if (teste && key == 'v'|| teste && key == 'V') {
   Do8.rewind();
   Do8.play();
   teste = false;
  }
  if (teste && key == 'b'|| teste && key == 'B') {
   Re8.rewind();
   Re8.play();
   teste = false;
  }
  if (teste && key == 'n'|| teste && key == 'N') {
   Mi8.rewind();
   Mi8.play();
   teste = false;
  }
  if (teste && key == 'm'|| teste && key == 'M') {
   Fa8.rewind();
   Fa8.play();
   teste = false;
  }
  if (teste && key == ',') {
   Sol8.rewind();
   Sol8.play();
   teste = false;
  }
  if (teste && key == '.') {
   La8.rewind();
   La8.play();
   teste = false;
  }
  if (teste && key == ';') {
   Si8.rewind();
   Si8.play();
   teste = false;
  }
  if (teste && key == 'h'|| teste && key == 'H') {
   DoS8.rewind();
   DoS8.play();
   teste = false;
  }
  if (teste && key == 'j'|| teste && key == 'J') {
   ReS8.rewind();
   ReS8.play();
   teste = false;
  }
  if (teste && key == 'k'|| teste && key == 'K') {
   FaS8.rewind();
   FaS8.play();
   teste = false;
  }
  if (teste && key == 'l'|| teste && key == 'L') {
   SolS8.rewind();
   SolS8.play();
   teste = false;
  }
  if (teste && key == 'ç'|| teste && key == 'Ç') {
   LaS8.rewind();
   LaS8.play();
   teste = false;
  }
}
//Trocar Oitavas
  if (key == '9') {
   GrupoOitavas = 1;
  }
  if (key == '0') {
   GrupoOitavas = 2;
  }
  if (key == '-') {
   GrupoOitavas = 3;
  }
  if (key == '=') {
   GrupoOitavas = 4;
  }
}

void keyReleased() {
  teste = true; 
}

//Tutoriais
void tutorial(){
  
  if (keyPressed) { if (key == 'z'||key == 'Z'){
    state = 1;
  }
  }
  
  if (keyPressed) { if (key == 'c'||key == 'C'){
    state = 3;
  }
  }
  
  textAlign(CENTER);
  fill(0); textSize(28);  text("'Z' para ir para o teclado", 400, 400);
  fill(0); textSize(28);  text("'C' para ir para a página sobre", 400, 450);
}

//Sobre
void sobre(){
  textAlign(CENTER);
  fill(0); textSize(64); text("Integrantes:", 400, 100);
  fill(0); textSize(28);  text("Henrique Marques da Silva de Oliveira", 400, 150);
  fill(0); textSize(28);  text("Lucas Fernando Assunção Cavalherie", 400, 200);
  fill(0); textSize(28);  text("Marco Vinicius Costódio Pellizzarro", 400, 250);
  fill(0); textSize(28);  text("Théo César Zanotto da Silva", 400, 300);
  fill(0); textSize(28);  text("'Z' para ir para o teclado", 400, 400);
  fill(0); textSize(28);  text("'X' para ir para a página de tutorial", 400, 450);
  
  if (keyPressed) { if (key == 'z'||key == 'Z'){
    state = 1;
  }
  }
  
  if (keyPressed) { if (key == 'x'||key == 'X'){
    state = 2;
  }
  }
}
