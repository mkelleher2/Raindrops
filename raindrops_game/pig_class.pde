//Create a class for the pigs
class Pig {
  //declare all variables
  PVector loc;
  PVector vel;
  PVector acc;
  int d;
  boolean disp;
  Pig() {
    //set the location to be a random point horizontally right above the screen
    loc=new PVector(random(d/2, width-d/2), -d);
    //set a random velocity for the pig
    vel=new PVector(0, random(2, 6));
    //create different sizes for the pigs
    d=int(random(50, 100));
    //set the acceleration in the y direction to .01
    acc= new PVector(0, .01);
    //set the image mode to center
    imageMode(CENTER);
    //start the pigs displaying
    disp=true;
  }
  void display(PImage pig) {
    //display the pig if disp is set to true
    if (disp) {
      image(pig, loc.x, loc.y, d, d);
    }
  }
  void move() {
    if (disp) {
      //move the pig at the established velocity
      loc.add(vel);
      //accelerate the  at the established velocity
      vel.add(acc);
    }
  }
  //Check if the drop it touching the catcher
  boolean touch(Catcher ca) {
    /*if the distance between the centers of the catcher and the pig is less than
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

