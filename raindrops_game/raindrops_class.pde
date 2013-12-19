//Create a class for the raindrops
class Raindrops {
  //declare all variables
  PVector loc;
  PVector vel;
  PVector acc;
  int d;
  boolean disp;

  Raindrops() {
    //initialize all variables
    loc=new PVector(random(d/2, width-d/2), -d);
    vel=new PVector(0, random(2, 6));
    d=int(random(30, 50));
    acc= new PVector(0, .01);
    score=0;
    //set the color mode to HSB and pick a random color within a range of blues for the raindrop
    //make it so that the raindrop will not have broder lines
    disp=true;
  }
  void display(PImage corn) {
    if (disp) {
      //create an ellipse for the raindrop
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
    //if the distance between the centers of the catcher and the raindrop is less than the sum of the radii, they are touching  
    if ((loc.dist(ca.loc))<(d/2+ca.d/2) && loc.y>(height-180) &&loc.y<(height-160)) {
      return true;
    }
    //otherwise they are not
    else {
      return false;
    }
  }
}

