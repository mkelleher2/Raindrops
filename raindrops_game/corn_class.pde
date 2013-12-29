//Create a class for the corn
class Corn {
  //declare all variables
  PVector loc;
  PVector vel;
  PVector acc;
  int d;
  boolean disp;
  Corn() {
    //set the location to be a random point horizontally right above the screen
    loc=new PVector(random(d/2, width-d/2), -d);
    //set a random velocity for the corn
    vel=new PVector(0, random(2, 6));
    //create different sizes for the corn ears
    d=int(random(30, 50));
    //set the acceleration in the y direction to .01
    acc= new PVector(0, .01);
    //start the corn displaying
    disp=true;
  }
  void display(PImage corn) {
    //display the corn if disp is set to true
    if (disp) {
      image(corn, loc.x, loc.y, d, d);
    }
  }
  void move() {
    if (disp) {
      //move the drop at the established velocity
      loc.add(vel);
      //accelerate the drop at the established velocity
      vel.add(acc);
    }
  }
  //Check if the drop it touching the catcher
  boolean touch(Catcher ca) {
    /*if the distance between the centers of the catcher and the corn is less than
     the sum of the radii and the drop is at the top of the catcher, they are touching*/
    if ((loc.dist(ca.loc))<(d/2+ca.d/2) && loc.y>(height-180) &&loc.y<(height-160)) {
      return true;
    }
    //otherwise they are not
    else {
      return false;
    }
  }
}

