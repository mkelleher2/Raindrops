//Create a class for the raindrops
class Raindrops {
  //declare all variables
  PVector loc;
  PVector vel;
  PVector acc;
  int d;
  color c;

  Raindrops() {
    //initialize all variables
    loc=new PVector(random(d/2, width-d/2), -d);
    vel=new PVector(0, random(2, 6));
    d=int(random(5, 15));
    acc= new PVector(0, .01);
    score=0;
    //set the color mode to HSB and pick a random color within a range of blues for the raindrop
    colorMode(HSB, 360, 100, 100);
    c=color(random(190, 210), 100, 100);
    //make it so that the raindrop will not have broder lines
    noStroke();
    
  }
  void display() {
    //fill the raindrop with the color established above
    fill(c);
    //create an ellipse for the raindrop
    ellipse(loc.x, loc.y, d, d);
  }
  void move() {
    //move the drop at the established velocity
    loc.add(vel);
    //accelerate the drop at the established velocity
    vel.add(acc);
  }
  //Check if the drop it touching the catcher
  boolean touch(Catcher ca) {
    //if the distance between the centers of the catcher and the raindrop is less than the sum of the radii, they are touching  
    if (loc.dist(ca.loc)<(d/2+ca.d/2)) {
      return true;
    }
    //otherwise they are not
    else {
      return false;
    }
  }
}

