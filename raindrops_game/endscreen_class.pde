class EndScreen {
  PImage happy, sad;
  
  EndScreen() {
    happy=loadImage("smile.png");
    sad=loadImage("frown.png");
      imageMode(CENTER);
        colorMode(HSB, 360, 100, 100);
  }

  void winScreen(Catcher c) {
    fill(0);
    rect(0,0,width,height);
    //display congratulatory text
    fill(random(190, 210), 100, 100);
    text("You win a Case of Satisfaction!!!!", width/2, height/2);
    //display the smiley face in the place of the catcher
    image(happy, mouseX, height-100, 200, 200);
  }
  void loseScreen(Catcher c) {
    fill(0);
    rect(0,0,width,height);
    //display uncongratulatory text
    fill(random(190, 210), 100, 100);
    text("wow..... I guess the answer wasn't in the pdf", width/2, height/2);
    //display the sad face in the place of the catcher
    image(sad, mouseX, height-100, 200, 200);
  }
}
