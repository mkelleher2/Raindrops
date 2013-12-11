//Create a class for the catcher
class Catcher {
  //Declare all variables
  PVector loc;
  int d;
  Catcher() {
    //initialize all variables
    loc= new PVector(mouseX, height-100);
    d=200;
  }
  void move() {
    //set color mode to RGB
    colorMode(RGB, 255, 255, 255);
    //Fill the catcher with white
    fill(255);
    //create an ellipse for the catcher
    ellipse(loc.x, loc.y, d, d);
    //set the x location of the mouse as the x location of the catcher
    loc.x=mouseX;
  }
}

