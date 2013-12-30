//create a class for the start and end screens
class StartEndScreen {
  StartEndScreen() {
    //set the image and rectangle modes to center
    imageMode(CENTER);
    rectMode(CENTER);
  }
  //if the player wins, show the win screen
  void winScreen(PImage background, PImage smile) {
    //display congratulatory text 
    fill(240, 100, 100);
    text("You win a Case of Satisfaction!!!! \n To play again press the R button", width/2, height/2);
    //display the smiley face in the place of the catcher
    image(smile, mouseX, height-100, 200, 200);
    //blur the background to black
    background.filter(BLUR);
  }
  //if the player loses, show the lose screen
  void loseScreen(PImage background, PImage frown) {
    //display uncongratulatory text
    fill(240, 100, 100);
    text("wow..... I guess the answer wasn't in the pdf \n To play again press the R button", width/2, height/2);
    //display the sad face in the place of the catcher
    image(frown, mouseX, height-100, 200, 200);
    //blur the background to black
    background.filter(BLUR);
  }
  //create one function that deals with both the start and the end conditions
  void displayEnd(Corn[] co, Catcher ca, Pig[] pig, PImage back, int loseVar, PImage winFace, PImage loseFace) {
    //if the score is greater than the required score to win and all the corn has fallen, the player wins
    if (score>=co.length*winReq && finishedDrops==co.length) {
      //stop displaying the corn, pigs, and catcher
      for (int i=0;i<co.length;i++) {
        co[i].disp=false;
      }
      for (int i=0;i<pig.length;i++) {
        pig[i].disp=false;
      }
      ca.disp=false;
      //turn on the win screen
      winScreen(back, winFace);
    }
    /*if the player lost all live or the score is less than the required score to win and
     all the corn has fallen, the player loses*/
    if ((score<co.length*winReq && finishedDrops==co.length) || loseVar==0) {
      //stop displaying the corn, pigs, and catcher
      for (int i=0;i<co.length;i++) {
        co[i].disp=false;
      }
      for (int i=0;i<pig.length;i++) {
        pig[i].disp=false;
      }
      ca.disp=false;
      //turn on lose screen
      loseScreen(back, loseFace);
    }
  }
  //create a function to show the start screen
  void displayStart(PImage startPic) {
    //show a blue background
    background(200, 100, 100);
    //display an image, the cloud, in the background
    image(startPic, width/2, height/2, 700, 500);
    //show a light blue button
    fill(220, 100, 100, 50);
    rect(width/2, height*9/20, width/2, height/10, 20, 20, 20, 20);
    //Display start text
    fill(0);
    text("Start", width/2, height*9/20);
  }
  //check if the button is pressed
  boolean runStart() {
    //if button is pressed, return true
    if (mouseX>width/4 && mouseX<3*width/4 &&mouseY>height*17/40 && mouseY<height*19/40) {
      return true;
    }
    //if it is not pressed, return false
    else {
      return false;
    }
  }
}

