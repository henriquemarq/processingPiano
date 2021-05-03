void setup(){
  size(1920,1080);
  background(255);
}
void draw(){
  int keyWidth= 0;
  int whiteWidth= width/9;
  float blackHeight= height*3/5;
  float blackWidth= whiteWidth/2;
  int blackHover= -1;
 
  for (int i=0; i<8; i++){
    float keyHeight= whiteWidth*(i+1)- blackWidth/2;
    if(mouseX> keyHeight && mouseX <= keyHeight+blackWidth && 
    mouseY <= blackHeight && i !=2){
    blackHover = i;
    }
  }
  for( int whiteKey=0; whiteKey < 9; whiteKey++){
    stroke(1);
    int keyHeight = whiteKey * whiteWidth;
    if(mouseX >= keyHeight && mouseX <= keyHeight+ whiteWidth && mouseY<= whiteWidth &&
    mousePressed && blackHover == keyHeight){
      fill(255,0,0);
    } else if(mouseX> keyHeight && mouseX <=keyHeight+ whiteWidth && blackHover == -1){
      fill(212, 212, 212);
    }else{
      fill(255);
    }
    rect(keyHeight, keyWidth, whiteWidth, height);
  }
  for(int blackKey=0; blackKey<7; blackKey++){
    noStroke();
    float keyHeight= whiteWidth*(blackKey+1)- blackWidth/2;
    if(blackKey==2){
      keyHeight= whiteWidth*(blackKey+1)-blackWidth/2+whiteWidth;
    }
    fill(0);
    blackHover= blackKey;
    if(mouseX> keyHeight&&mouseX<=keyHeight+blackWidth && mouseY<= blackHeight
    && mousePressed &&blackHover== blackKey){
      stroke(2);
      fill(219, 219, 219);
    }else{
      fill(0);
    }
    rect(keyHeight, keyWidth, blackWidth, blackHeight);
  }
}
