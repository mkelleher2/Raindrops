class StartEndScreen {


  StartEndScreen() {
    imageMode(CENTER);
    rectMode(CENTER);
  }

  void winScreen(PImage back) {
    //display congratulatory text
    fill(240, 100, 100);
    text("You win a Case of Satisfaction!!!! \n To play again press the R button", width/2, height/2);
    //display the smiley face in the place of the catcher
    image(happy, mouseX, height-100, 200, 200);
    back.filter(BLUR);
  }
  void loseScreen(PImage back) {
    //display uncongratulatory text
    fill(240, 100, 100);
    text("wow..... I guess the answer wasn't in the pdf \n To play again press the R button", width/2, height/2);
    //display the sad face in the place of the catcher
    image(sad, mouseX, height-100, 200, 200);
    back.filter(BLUR);
  }
  void displayEnd(Corn[] co, Catcher ca, Pig[] pig, PImage C, int loseVar) {
    if (score>=co.length*winReq && finishedDrops==co.length) {
      for (int i=0;i<co.length;i++) {
        co[i].disp=false;
      }
      for (int i=0;i<pig.length;i++) {
        pig[i].disp=false;
      }
      ca.disp=false;
      winScreen(C);
    }
    /*When all the dots are finished,and the score is less than the
     percentage of the possible score required to win display lose screen*/
    if (score<co.length*winReq && finishedDrops==co.length) {
      for (int i=0;i<co.length;i++) {
        co[i].disp=false;
      }
      for (int i=0;i<pig.length;i++) {
        pig[i].disp=false;
      }
      ca.disp=false;
      loseScreen(C);
    }
    if (loseVar==0) {
      for (int i=0;i<co.length;i++) {
        co[i].disp=false;
      }
      for (int i=0;i<pig.length;i++) {
        pig[i].disp=false;
      }
      ca.disp=false;
      loseScreen(C);
    }
  }
  void displayStart(PImage startPic) {
    background(200, 100, 100);
    image(cloud, width/2, height/2, 700, 500);
    fill(220, 100, 100, 50);
    rect(width/2, height*9/20, width/2, height/10, 20, 20, 20, 20);
    fill(0);
    text("Start", width/2, height*9/20);
  }
  boolean run() {
    if (mouseX>width/4 && mouseX<3*width/4 &&mouseY>height*17/40 && mouseY<height*19/40) {
      return true;
    }
    else {
      return false;
    }
  }
}

