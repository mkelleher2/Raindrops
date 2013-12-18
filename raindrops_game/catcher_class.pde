//Create a class for the catcher
class Catcher {
  //Declare all variables
  PVector loc;
  int d;
  boolean disp;
  PImage catcher;
  Catcher() {
    //initialize all variables
    loc= new PVector(mouseX, height-100);
    d=200;
    disp=true;
    catcher=loadImage("catcher.png");
  }
  void move() {
    if (disp) {
      fill(360, 0, 100);
      //create an ellipse for the catcher
      image(catcher,loc.x, loc.y, d, d);
      //set the x location of the mouse as the x location of the catcher
      loc.x=mouseX;
    }
  }
}

