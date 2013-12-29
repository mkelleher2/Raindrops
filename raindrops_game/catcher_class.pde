//Create a class for the catcher
class Catcher {
  //Declare all variables
  PVector loc;
  int d;
  boolean disp;
  Catcher() {
    //initialize  the location to be at 100 pixels from the bottom of the screen a the mouse x location
    loc= new PVector(mouseX, height-100);
    //set the diamter of the image to be 200
    d=200;
    //turn on the display
    disp=true;
   
  }
  void move(PImage tempCatch) {
    if (disp) {
      //display the image
      image(tempCatch,loc.x, loc.y, d, d);
      //set the x location of the mouse as the x location of the catcher
      loc.x=mouseX;
    }
  }
}

