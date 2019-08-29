import ddf.minim.*;
Minim minim;
AudioPlayer player;
final float GRAVITY=9.8;

float speed=0;
float y;//落下してくるもののy
float x;//落下してくるもののx

float x_re; //なんぼ―君になるであろう物のxの値
float easing = 0.5;
float kasoku=0;

PImage img_na;
PImage img_hi;


void setup() {
  size(680, 880);
  frameRate(100);
  //画像を読み込み
 // img_rei = loadImage("photo.jpg");
  img_na = loadImage("nambo.png");
  img_hi = loadImage("Hirao_kai.png");
  minim = new Minim(this);
  player = minim.loadFile("retrogamecenter.mp3");
  player.play();
  x = 250;
}

void draw() {
   
   background(255); 
   image(img_na, x_re-20, 670, width/4, height/4);//なんぼ―君の画像
   image(img_hi, x-160, y-80, width/2, height/4);//ひらおの画像
  
   speed+=9.8/60+kasoku;
   y+=speed;
   smooth();
   noStroke();
   fill(200);
 ellipse(x,y+30,230,230); // 平尾
  
  float dx_na = mouseX -x_re;  //なんぼ―君の左右への動き
  if(abs(dx_na) > 10){
  x_re +=dx_na*easing;
  }
  ellipse(x_re+60, 750, 120, 120);//  なんぼ―君
  
 
 if(y>880){
 
   reset();
 
 }
   
  float dx,dy,dr;
  
  dx = abs(x_re+60-x);
  dy = abs(750-y+30);
  dr = 60+115;
  
  if(sqrt(sq(dx)+sq(dy)) < dr){
  
  textSize(100);
  
  fill(0,0,255);
  text("Game Over",100,300);
  
  gameOver();
  
  }
  
  
  
}  
void reset(){
      y=-50;
    speed=0;
    x=50+random(680);
    
}


void gameOver(){

   player.close();  //サウンドデータを終了
  minim.stop();
  super.stop();
  

}