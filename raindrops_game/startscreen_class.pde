class StartScreen {
  PImage cloud;

  StartScreen() {
    colorMode(HSB,360,100,100);
    cloud=loadImage("cloud.png");
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
  }
  void display() {
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

