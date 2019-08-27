float hirao = 0, up = 1;
int click_x, click_y;
int click_lv = 1, click_lv_x, click_lv_y;
float click_lv_next = 10;
PFont font;
boolean click_lv_up;

//click_inclease
int click_lv_next2[] = {10, 100, 300, 800, 2000, 5000, 15000, 40000};
int click_up[] = {0, 2, 3, 5, 8, 12, 20, 30};

void setup() {
  size(1500, 1000);
  click_x = 250; 
  click_y = height/2;
  click_lv_x = 1000; 
  click_lv_y = 0;
}

void draw() {
  background(0);
  fill(255);
  rect(500, 0, 500, height);
  rect(1000, 0, 1000, height);

  //クリック
  ellipse(click_x, click_y, 400, 400);

  //所持ヒラオ
  font = createFont("MS Gothic", 100);
  textFont(font);
  textAlign(CENTER);
  textSize(40);
  if (hirao < 1000) {
    text("ヒラオ："+hirao, 250, 60);
  } else if ((hirao >= 1000)&&(hirao < 1000000)) {
    text("ヒラオ："+hirao/1000+"K", 250, 60);
  }

  //宣伝(クリックレベル)
  rect(click_lv_x, click_lv_y, 500, 100);
  fill(0);
  text("宣伝", 1050, 65);
  text("LV."+click_lv, 1400, 65);
  if (hirao >= click_lv_next) {
    fill(0);
  } else {
    fill(255, 0, 0);
  }
  if (click_lv_next < 1000) {
    text(click_lv_next, 1200, 65);
  } else if ((click_lv_next >= 1000)&&(click_lv_next < 1000000)) {
    text(click_lv_next/1000+"K", 1200, 65);
  }
  if (click_lv_up == false) {
    fill(0, 100);
    rect(click_lv_x, click_lv_y, 500, 100);
  }
}

void mousePressed() {
  if (dist(mouseX, mouseY, click_x, click_y) < 200) { //クリック
    hirao += up;
  }

  //宣伝レベルアップ
  if ((hirao >= click_lv_next)) {
    click_lv_up = true;
    if ((mouseX >= click_lv_x)&&(mouseX <= width)&&(mouseY >= 0)&&(mouseY <= 100)) {
      click_increase();
    }
  }
}

void click_increase() {
  up = click_up[click_lv];
  click_lv_next = click_lv_next2[click_lv];
  hirao -= click_lv_next2[click_lv-1];
  click_lv_up = false;
  click_lv++;
}
