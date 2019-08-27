final float GRAVITY=9.8;
float speed=0;
float y;//落下してくるもののy
float x;//落下してくるもののx

float x_re; //なんぼ―君になるであろう物のxの値
float easing = 0.5;
int bingo=0;
float goodx=0;
float goody=0;
float kasoku=0;
PImage img; //画像データ

void setup() {
  size(880, 880);
  //画像を読み込み
  img = loadImage("photo.jpg");
  x = 250;
}

void draw() {
   background(255);
  //画面に画像データを表示
  image(img, width/4, height/4, width/2, height/2);
   speed+=9.8/60+kasoku;
  y+=speed;
  smooth();
  noStroke();
  fill(200);
  ellipse(x,y,50,50);
  
  float dx = mouseX -x_re;
  if(abs(dx) > 10){
  x_re +=dx*easing;
  }
  rect(x_re, 780, 80, 90);
  
  if(y>880-25){
    speed=-speed*0.6;
    y=880-25;
  }
  if(mouseX>x-25 && mouseX<x+25 &&
     mouseY>y-25 && mouseY<y+25){
     bingo=60;
     reset(); 
     kasoku+=0.01;
     goodx=mouseX;
     goody=mouseY;
     }
  if(bingo>0){
    fill(0);
    textSize(50);
    text("good!",goodx,goody);
    bingo-=1;
  }
  
}  
void reset(){
      y=-50;
    speed=0;
    x=50+random(400);
    
}