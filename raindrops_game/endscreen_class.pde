class EndScreen {
  PImage happy, sad;

  EndScreen() {
    happy=loadImage("smile.png");
    sad=loadImage("frown.png");
    imageMode(CENTER);
    colorMode(HSB, 360, 100, 100);
  }

  void winScreen() {
    //display congratulatory text
    fill(200, 100, 100);
    text("You win a Case of Satisfaction!!!!", width/2, height/2);
    //display the smiley face in the place of the catcher
    image(happy, mouseX, height-100, 200, 200);
  }
  void loseScreen() {
    //display uncongratulatory text
    fill(200, 100, 100);
    text("wow..... I guess the answer wasn't in the pdf", width/2, height/2);
    //display the sad face in the place of the catcher
    image(sad, mouseX, height-100, 200, 200);
  }

  void display(Raindrops[] ra, Catcher ca, Pig[] pig) {
    if (score>=ra.length*winReq && finishedDrops==r.length) {
      for (int i=0;i<ra.length;i++) {
        ra[i].disp=false;
      }
      for (int i=0;i<pig.length;i++) {
        pig[i].disp=false;
      }
      ca.disp=false;
      
      end.winScreen();
    }
    /*When all the dots are finished,and the score is less than the
     percentage of the possible score required to win display lose screen*/
    if (score<ra.length*winReq && finishedDrops==r.length) {
      for (int i=0;i<ra.length;i++) {
        ra[i].disp=false;
      }
      for (int i=0;i<pig.length;i++) {
        pig[i].disp=false;
      }
      ca.disp=false;
      end.loseScreen();
    }
    if (pigsCaught==3) {
      for (int i=0;i<ra.length;i++) {
        ra[i].disp=false;
      }
      for (int i=0;i<pig.length;i++) {
        pig[i].disp=false;
      }
      ca.disp=false;
      end.loseScreen();
    }
  }
}

