float hirao = 100000, up = 1; //ヒラオ・クリック
int click_x, click_y;
int click_lv = 1, click_lv_x, click_lv_y;
float click_lv_next = 10;
float up1 = 0; //名言1
int time1_lv = 0, time_lv_x, time1_lv_y;
float time1_lv_next = 100;
float up2 = 0; //名言2
int time2_lv = 0, time2_lv_y;
float time2_lv_next = 500;
float up3 = 0; //名言3
int time3_lv = 0, time3_lv_y;
float time3_lv_next = 1800;
float up4 = 0; //名言4
int time4_lv = 0, time4_lv_y;
float time4_lv_next = 3000;
float up5 = 0; //名言5
int time5_lv = 0, time5_lv_y;
float time5_lv_next = 4500;
float up6 = 0; //名言6
int time6_lv = 0, time6_lv_y;
float time6_lv_next = 8000;
float sum; //時間増加合計
boolean click_lv_up; //レベルアップ可能
boolean time1_start, time1_lv_up;
boolean time2_start, time2_lv_up;
boolean time3_start, time3_lv_up;
boolean time4_start, time4_lv_up;
boolean time5_start, time5_lv_up;
boolean time6_start, time6_lv_up;
PFont font; //文字
PImage image; //平生画像
float game = 1000; //ミニゲーム
int game_click = 0;
boolean play;
float game_hirao[] = {1000, 3000, 5000, 10000, 15000, 20000, 25000, 40000, 50000, 60000,
  75000, 100000, 125000, 150000, 200000, 300000, 400000, 500000, 600000, 750000,
  1000000, 1250000, 1500000, 2000000};

//click_inclease
float click_lv_next2[] = {10, 100, 300, 800, 2000, 5000, 12000, 30000, 80000, 180000, 
  400000, 750000, 1350000, 1980000, 2700000, 4320000, 6400000, 9870000, 15000000, 27500000};
float click_up[] = {1, 2, 5, 9, 17, 30, 50, 90, 150, 225, 
  366, 590, 888, 1550, 2490, 3600, 5000, 9000, 12000, 15000};
//time1_increase
float time1_lv_next2[] = {100, 200, 400, 1000, 5000, 10000, 18000, 29000, 44000, 78000, 
  120000, 175000, 248000, 333000, 456000, 600000, 790000, 1000000, 1345000, 1780000};
float time1_up[] = {1, 3, 6, 12, 19, 29, 52, 80, 123, 171, 
  230, 302, 405, 525, 666, 832, 999, 1190, 1450, 1780};
//time2_increse
float time2_lv_next2[] = {500, 1000, 3500, 8000, 18500, 34000, 60000, 105000, 170000, 285000, 
  400000, 543000, 710000, 905000, 1150000, 1390000, 1700000, 2220000, 2876000, 3600000};
float time2_up[] = {3, 7, 14, 29, 50, 86, 121, 178, 234, 298, 
  375, 470, 599, 645, 800, 990, 1175, 1430, 1830, 2300};
//time3_increse
float time3_lv_next2[] = {1800, 3000, 5200, 13500, 24600, 48000, 79000, 158000, 290000, 415000, 
  540000, 700000, 905000, 1150000, 1400000};
float time3_up[] = {4, 10, 19, 36, 70, 99, 145, 210, 300, 444, 
  600, 800, 1075, 1440, 1999};
//time4_increse
float time4_lv_next2[] = {3000, 5000, 9600, 15200, 33000, 58500, 112000, 194500, 340000, 500000};
float time4_up[] = {6, 13, 26, 41, 88, 135, 192, 315, 469, 654};
//time5_increse
float time5_lv_next2[] = {4500, 7500, 11700, 18000, 36500, 63000, 130000, 245000, 394000, 595000};
float time5_up[] = {9, 20, 35, 59, 100, 163, 246, 350, 539, 765};
//time6_increse
float time6_lv_next2[] = {8000, 12500, 18500, 26000, 39500, 70000, 155000, 270000, 415000, 630000};
float time6_up[] = {13, 25, 43, 69, 123, 210, 321, 479, 690, 987};

void setup() {
  size(1500, 1000);
  click_x = 250; 
  click_y = height/2;
  click_lv_x = 1000; 
  click_lv_y = 0;
  time_lv_x = 1000; 
  time1_lv_y = 100;
  time2_lv_y = 200;
  time3_lv_y = 300;
  time4_lv_y = 400;
  time5_lv_y = 500;
  time6_lv_y = 600;
  image = loadImage("hirao.png");
  font = createFont("MS Gothic", 40);
  textFont(font);
}

void draw() {
  background(0);
  fill(100, 220, 255);
  rect(0, 0, 500, height);
  noFill();
  stroke(255);
  rect(520, 730, 960, 240);
  fill(255);
  textSize(60);
  text("ヒラオクリッカー", 1000, 805);
  textSize(35);
  text("平生釟三郎氏の知名度を上げ ヒラオをゲットしよう", 1000, 870);
  text("ヒラオを使って 平生氏の名言やミニゲームが解放できるぞ", 1000, 930);

  //クリック
  noStroke();
  ellipse(click_x, click_y, 400, 400);
  stroke(0);
  if ((mousePressed)&&(dist(mouseX, mouseY, click_x, click_y) < 200)) {
    image(image, 20, 250, 450, 450);
  } else {
    image(image, 10, 240, 470, 470);
  }

  //ヒラオ
  textAlign(CORNER);
  textSize(40);
  if (hirao < 1000) {
    text("ヒラオ："+hirao_to_text(hirao), 20, 60);
  } else if ((hirao >= 1000)&&(hirao < 1000000)) {
    text("ヒラオ："+hirao_to_text(hirao/1000)+"K", 20, 60);
  } else if ((hirao >= 1000000)&&(hirao < 1000000000f)) {
    text("ヒラオ："+hirao_to_text(hirao/1000000)+"M", 20, 60);
  } else if ((click_lv_next >= 1000000000f)&&(click_lv_next < 1000000000000f)) {
    text("ヒラオ："+hirao_to_text(hirao/1000000000f)+"G", 20, 60);
  } else if ((click_lv_next >= 1000000000000f)&&(click_lv_next < 1000000000000000f)) {
    text("ヒラオ："+hirao_to_text(hirao/1000000000000f)+"T", 20, 60);
  }
  //クリック毎・秒間ヒラオ
  textAlign(CENTER);
  textSize(28);
  if (up < 1000) {
    text("１クリック"+up+"ヒラオ", 250, 910);
  } else if ((up >= 1000)&&(up < 1000000)) {
    text("１クリック"+up/1000+"Kヒラオ", 250, 910);
  } else if ((up >= 1000000)&&(up < 1000000000f)) {
    text("１クリック"+up/1000000+"Mヒラオ", 250, 910);
  } else if ((up >= 1000000000)&&(up < 1000000000000f)) {
    text("１クリック"+up/1000000000+"Gヒラオ", 1220, 910);
  }
  if (sum < 1000) {
    text("秒間"+sum+"ヒラオ", 250, 950);
  } else if ((sum >= 1000)&&(sum < 1000000)) {
    text("秒間"+sum/1000+"Kヒラオ", 250, 950);
  } else if ((sum >= 1000000)&&(sum < 1000000000f)) {
    text("秒間"+sum/1000000+"Mヒラオ", 250, 950);
  } else if ((sum >= 1000000000)&&(sum < 1000000000000f)) {
    text("秒間"+sum/1000000000+"Gヒラオ", 1220, 950);
  }

  //宣伝(クリックレベル)
  rect(click_lv_x, click_lv_y, 500, 100);
  fill(0);
  textSize(40);
  text("宣伝", 1050, 65);
  text("LV."+click_lv, 1400, 65);
  if (hirao >= click_lv_next) {
    fill(0);
  } else {
    fill(255, 0, 0);
  }
  textSize(30);
  if (click_lv_next < 1000) {
    text(click_lv_next+"ヒラオ", 1220, 65);
  } else if ((click_lv_next >= 1000)&&(click_lv_next < 1000000)) {
    text(click_lv_next/1000+"Kヒラオ", 1220, 65);
  } else if ((click_lv_next >= 1000000)&&(click_lv_next < 1000000000)) {
    text(click_lv_next/1000000+"Mヒラオ", 1220, 65);
  } else if ((click_lv_next >= 1000000000)&&(click_lv_next < 1000000000000f)) {
    text(click_lv_next/1000000000+"Gヒラオ", 1220, 65);
  }
  if (hirao >= click_lv_next) {
    click_lv_up = true;
  } else {
    click_lv_up = false;
  }
  if (click_lv_up == false) {
    fill(0, 80);
    rect(click_lv_x, click_lv_y, 500, 100);
  }

  //自動生産1
  fill(255);
  if (time1_start == true) {
    hirao += up1/frameRate;
    text("何事であらうと凡て人のする仕事に", 750, 50);
    text("苦労をせずして成功するものは無い", 750, 90);
  }
  rect(time_lv_x, time1_lv_y, 500, 100);
  fill(0);
  textSize(40);
  text("名言1", 1060, 165);
  text("LV."+time1_lv, 1400, 165);
  if (hirao >= time1_lv_next) {
    fill(0);
  } else {
    fill(255, 0, 0);
  }
  textSize(30);
  if (time1_lv_next < 1000) {
    text(time1_lv_next+"ヒラオ", 1220, 165);
  } else if ((time1_lv_next >= 1000)&&(time1_lv_next < 1000000)) {
    text(time1_lv_next/1000+"Kヒラオ", 1220, 165);
  } else if ((time1_lv_next >= 1000000)&&(time1_lv_next < 1000000000)) {
    text(time1_lv_next/1000000+"Mヒラオ", 1220, 165);
  } else if ((time1_lv_next >= 1000000000)&&(time1_lv_next < 1000000000000f)) {
    text(time1_lv_next/1000000000+"Gヒラオ", 1220, 165);
  }
  if (hirao >= time1_lv_next) {
    time1_lv_up = true;
  } else {
    time1_lv_up = false;
  }
  if (time1_lv_up == false) {
    fill(0, 80);
    rect(time_lv_x, time1_lv_y, 500, 100);
  }

  //自動生産2
  fill(255);
  if (time2_start == true) {
    hirao += up2/frameRate;
    text("蒔かぬ種は生へざるも", 750, 150);
    text("蒔きたる小さき種も", 750, 190);
    text("時立ち年を経れば喬木となる", 750, 230);
  }
  fill(255);
  rect(time_lv_x, time2_lv_y, 500, 100);
  fill(0);
  textSize(40);
  text("名言2", 1060, 265);
  text("LV."+time2_lv, 1400, 265);
  if (hirao >= time2_lv_next) {
    fill(0);
  } else {
    fill(255, 0, 0);
  }
  textSize(30);
  if (time2_lv_next < 1000) {
    text(time2_lv_next+"ヒラオ", 1220, 265);
  } else if ((time2_lv_next >= 1000)&&(time2_lv_next < 1000000)) {
    text(time2_lv_next/1000+"Kヒラオ", 1220, 265);
  } else if ((time2_lv_next >= 1000000)&&(time2_lv_next < 1000000000)) {
    text(time2_lv_next/1000000+"Mヒラオ", 1220, 265);
  } else if ((time2_lv_next >= 1000000000)&&(time2_lv_next < 1000000000000f)) {
    text(time2_lv_next/1000000000+"Gヒラオ", 1220, 265);
  }
  if (hirao >= time2_lv_next) {
    time2_lv_up = true;
  } else {
    time2_lv_up = false;
  }
  if ((time2_lv_up == false)||(time1_start == false)) {
    fill(0, 80);
    rect(time_lv_x, time2_lv_y, 500, 100);
  }

  //自動生産3
  fill(255);
  if (time3_start == true) {
    hirao += up3/frameRate;
    text("大木は風の為に倒れずして", 750, 290);
    text("中幹の腐朽のために死す", 750, 330);
  }
  fill(255);
  rect(time_lv_x, time3_lv_y, 500, 100);
  fill(0);
  textSize(40);
  text("名言3", 1060, 365);
  text("LV."+time3_lv, 1400, 365);
  if (hirao >= time3_lv_next) {
    fill(0);
  } else {
    fill(255, 0, 0);
  }
  textSize(30);
  if (time3_lv_next < 1000000) {
    text(time3_lv_next/1000+"Kヒラオ", 1220, 365);
  } else if ((time3_lv_next >= 1000000)&&(time3_lv_next < 1000000000)) {
    text(time3_lv_next/1000000+"Mヒラオ", 1220, 365);
  } else if ((time3_lv_next >= 1000000000)&&(time3_lv_next < 1000000000000f)) {
    text(time3_lv_next/1000000000+"Gヒラオ", 1220, 365);
  }
  if (hirao >= time3_lv_next) {
    time3_lv_up = true;
  } else {
    time3_lv_up = false;
  }
  if ((time3_lv_up == false)||(time2_start == false)) {
    fill(0, 80);
    rect(time_lv_x, time3_lv_y, 500, 100);
  }

  //自動生産4
  fill(255);
  if (time4_start == true) {
    hirao += up4/frameRate;
    text("凡て人は皆天才である", 750, 390);
  }
  fill(255);
  rect(time_lv_x, time4_lv_y, 500, 100);
  fill(0);
  textSize(40);
  text("名言4", 1060, 465);
  text("LV."+time4_lv, 1400, 465);
  if (hirao >= time4_lv_next) {
    fill(0);
  } else {
    fill(255, 0, 0);
  }
  textSize(30);
  if (time4_lv_next < 1000000) {
    text(time4_lv_next/1000+"Kヒラオ", 1220, 465);
  } else if ((time4_lv_next >= 1000000)&&(time4_lv_next < 1000000000)) {
    text(time4_lv_next/1000000+"Mヒラオ", 1220, 465);
  } else if ((time4_lv_next >= 1000000000)&&(time4_lv_next < 1000000000000f)) {
    text(time4_lv_next/1000000000+"Gヒラオ", 1220, 465);
  }
  if (hirao >= time4_lv_next) {
    time4_lv_up = true;
  } else {
    time4_lv_up = false;
  }
  if ((time4_lv_up == false)||(time3_start == false)) {
    fill(0, 80);
    rect(time_lv_x, time4_lv_y, 500, 100);
  }

  //自動生産5
  fill(255);
  if (time5_start == true) {
    hirao += up5/frameRate;
    text("正しく 強く 朗らかに", 750, 450);
  }
  fill(255);
  rect(time_lv_x, time5_lv_y, 500, 100);
  fill(0);
  textSize(40);
  text("名言5", 1060, 565);
  text("LV."+time5_lv, 1400, 565);
  if (hirao >= time5_lv_next) {
    fill(0);
  } else {
    fill(255, 0, 0);
  }
  textSize(30);
  if (time5_lv_next < 1000000) {
    text(time5_lv_next/1000+"Kヒラオ", 1220, 565);
  } else if ((time5_lv_next >= 1000000)&&(time5_lv_next < 1000000000)) {
    text(time5_lv_next/1000000+"Mヒラオ", 1220, 565);
  } else if ((time5_lv_next >= 1000000000)&&(time5_lv_next < 1000000000000f)) {
    text(time5_lv_next/1000000000+"Gヒラオ", 1220, 565);
  }
  if (hirao >= time5_lv_next) {
    time5_lv_up = true;
  } else {
    time5_lv_up = false;
  }
  if ((time5_lv_up == false)||(time4_start == false)) {
    fill(0, 80);
    rect(time_lv_x, time5_lv_y, 500, 100);
  }

  //自動生産6
  fill(255);
  if (time6_start == true) {
    hirao += up6/frameRate;
    text("世界に通用する紳士たれ", 750, 510);
    noFill();
    stroke(255);
    rect(540, 540, 420, 150); 
    rect(550, 550, 400, 130);
    textSize(45);
    text("ミニゲーム", 750, 610);
    textSize(35);
    if (hirao >= game) {
      fill(255);
    } else {
      fill(255, 0, 0);
    }
    if (game < 1000000) {
      text(game/1000+"Kヒラオ", 750, 655);
    } else if ((game >= 1000000)&&(game < 1000000000)) {
      text(game/1000000+"Mヒラオ", 750, 655);
    }
    if ((hirao >= game)&&(mouseX >= 540)&&(mouseX <= 960)&&(mouseY >= 540)&&(mouseY <= 690)) {
      fill(255, 80);
      rect(550, 550, 400, 130);
    }
    stroke(0);
  }
  fill(255);
  rect(time_lv_x, time6_lv_y, 500, 100);
  fill(0);
  textSize(40);
  text("名言6", 1060, 665);
  text("LV."+time6_lv, 1400, 665);
  if (hirao >= time6_lv_next) {
    fill(0);
  } else {
    fill(255, 0, 0);
  }
  textSize(30);
  if (time6_lv_next < 1000000) {
    text(time6_lv_next/1000+"Kヒラオ", 1220, 665);
  } else if ((time6_lv_next >= 1000000)&&(time6_lv_next < 1000000000)) {
    text(time6_lv_next/1000000+"Mヒラオ", 1220, 665);
  } else if ((time6_lv_next >= 1000000000)&&(time6_lv_next < 1000000000000f)) {
    text(time6_lv_next/1000000000+"Gヒラオ", 1220, 665);
  }
  if (hirao >= time6_lv_next) {
    time6_lv_up = true;
  } else {
    time6_lv_up = false;
  }
  if ((time6_lv_up == false)||(time5_start == false)) {
    fill(0, 80);
    rect(time_lv_x, time6_lv_y, 500, 100);
  }

  sum = up1+up2+up3+up4+up5+up6;
  
  //ミニゲーム
  if(play == true){
    
  }
}

void mousePressed() {
  if ((dist(mouseX, mouseY, click_x, click_y) < 200)&&(play == false)) { //クリック
    hirao += up;
  }

  //ミニゲーム
  if ((time6_start == true)&&(play == false)) {
    if ((hirao >= game)&&(mouseX >= 540)&&(mouseX <= 960)&&(mouseY >= 540)&&(mouseY <= 690)) {
      hirao -= game;
      game_click ++;

      //ミニゲーム画面に遷移
      play = true;
      //ミニゲーム終了
      play = false;
    }
    game = game_hirao[game_click];
  }

  if (play == false) {
    //宣伝レベルアップ
    if ((hirao >= click_lv_next)) {
      click_lv_up = true;
      if ((mouseX >= click_lv_x)&&(mouseX <= width)&&(mouseY >= 0)&&(mouseY < 100)) {
        click_increase();
      }
    }

    //名言1レベルアップ
    if (hirao >= time1_lv_next) {
      time1_lv_up = true;
      if ((mouseX >= time_lv_x)&&(mouseX <= width)&&(mouseY >= 100)&&(mouseY < 200)) {
        if (hirao >= 100) {
          time1_start = true;
          time1_increase();
        }
      }
    }

    //名言2レベルアップ
    if (hirao >= time2_lv_next) {
      time2_lv_up = true;
      if ((mouseX >= time_lv_x)&&(mouseX <= width)&&(mouseY >= 200)&&(mouseY < 300)) {
        if ((hirao >= 500)&&(time1_start == true)) {
          time2_start = true;
          time2_increase();
        }
      }
    }

    //名言3レベルアップ
    if (hirao >= time3_lv_next) {
      time3_lv_up = true;
      if ((mouseX >= time_lv_x)&&(mouseX <= width)&&(mouseY >= 300)&&(mouseY < 400)) {
        if ((hirao >= 1800)&&(time2_start == true)) {
          time3_start = true;
          time3_increase();
        }
      }
    }

    //名言4レベルアップ
    if (hirao >= time4_lv_next) {
      time4_lv_up = true;
      if ((mouseX >= time_lv_x)&&(mouseX <= width)&&(mouseY >= 400)&&(mouseY < 500)) {
        if ((hirao >= 3000)&&(time3_start == true)) {
          time4_start = true;
          time4_increase();
        }
      }
    }

    //名言5レベルアップ
    if (hirao >= time5_lv_next) {
      time5_lv_up = true;
      if ((mouseX >= time_lv_x)&&(mouseX <= width)&&(mouseY >= 500)&&(mouseY < 600)) {
        if ((hirao >= 4500)&&(time4_start == true)) {
          time5_start = true;
          time5_increase();
        }
      }
    }

    //名言6レベルアップ
    if (hirao >= time6_lv_next) {
      time6_lv_up = true;
      if ((mouseX >= time_lv_x)&&(mouseX <= width)&&(mouseY >= 600)&&(mouseY < 700)) {
        if ((hirao >= 8000)&&(time5_start == true)) {
          time6_start = true;
          time6_increase();
        }
      }
    }
  }
}

void click_increase() {
  up = click_up[click_lv];
  click_lv_next = click_lv_next2[click_lv];
  hirao -= click_lv_next2[click_lv-1];
  click_lv_up = false;
  click_lv ++;
}

void time1_increase() {
  up1 = time1_up[time1_lv];
  time1_lv_next = time1_lv_next2[time1_lv+1];
  hirao -= time1_lv_next2[time1_lv];
  time1_lv ++;
}

void time2_increase() {
  up2 = time2_up[time2_lv];
  time2_lv_next = time2_lv_next2[time2_lv+1];
  hirao -= time2_lv_next2[time2_lv];
  time2_lv ++;
}

void time3_increase() {
  up3 = time3_up[time3_lv];
  time3_lv_next = time3_lv_next2[time3_lv+1];
  hirao -= time3_lv_next2[time3_lv];
  time3_lv ++;
}

void time4_increase() {
  up4 = time4_up[time4_lv];
  time4_lv_next = time4_lv_next2[time4_lv+1];
  hirao -= time4_lv_next2[time4_lv];
  time4_lv ++;
}

void time5_increase() {
  up5 = time5_up[time5_lv];
  time5_lv_next = time5_lv_next2[time5_lv+1];
  hirao -= time5_lv_next2[time5_lv];
  time5_lv ++;
}

void time6_increase() {
  up6 = time6_up[time6_lv];
  time6_lv_next = time6_lv_next2[time6_lv+1];
  hirao -= time6_lv_next2[time6_lv];
  time6_lv ++;
}

float hirao_to_text(float fhirao) {
  float res = (float)((int)(fhirao*10))/10;
  return res;
}
