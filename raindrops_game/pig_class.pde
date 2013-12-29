//Create a class for the pigs
class Pig {
  //declare all variables
  PVector loc;
  PVector vel;
  PVector acc;
  int d;
  PImage pig;

  Pig() {
    //initialize all variables
    loc=new PVector(random(d/2, width-d/2), -d);
    vel=new PVector(0, random(2, 6));
    d=int(random(50, 100));
    acc= new PVector(0, .01);
    imageMode(CENTER);
    pig=loadImage("pig.png");
  }
  void display() {
    image(pig, loc.x, loc.y, d, d);
  }
  void move() {
    //move the pig at the established velocity
    loc.add(vel);
    //accelerate the  at the established velocity
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
