int px = 200;
int py = 350;
int pw = 40;
int ph = 20;
int ow = 30;
int oh = 30;
int[] oy = new int[10];
int[] oColor = new int[10];
int[] oWait = new int[10];


void setup(){
  size(400,400);
  noStroke();
  for(int i=0; i<10; i++){
   objInit(i);
  }
}
 
void draw(){
  background(0);
  objMove();
  objDisp();
  playerMove();
  playerDisp();
  hitCheck();
}
void playerDisp(){
 fill(255);
 rect(px,py,pw,ph,5);
}
void playerMove(){
  px = mouseX;
 if((px+pw)>width){
   px = width - pw;
 }
}
void objDisp(){
  for(int i=0; i<10; i++){
    if( oColor[i] == 0){
    fill(255,0,0);
    }else{
      fill(0,255,0);
    }
    rect(i*40+5,oy[i],ow,oh,5);
  }
}
void objMove(){
  for(int i=0; i<10; i++){
    if( oWait[i]>0){
      oWait[i]--;
    }else{
      oy[i] += 2;
    }
    if( oy[i]> height ){
      objInit(i);
    }
  }
}
      
void objInit(int no){
  oy[no] = 40;
  oColor[no] = int(random(2));
  oWait[no] = int(random(60,240));
}
void hitCheck(){
  int ox;
  for(int i=0; i<10; i++){
    ox = i*40+5;
    if( (px <(ox+ow)) && ((px+pw) > ox)
    &&(py < (oy[i]+oh))&&((py+ph) > oy[i])){
      objInit(i);
    }
  }
}
    
