class Raindrops {
  PVector loc;
  PVector vel;
  PVector acc;
  int d;
  color c;
  Raindrops() {
    colorMode(HSB, 360, 100, 100);
    loc=new PVector(random(d/2, width-d/2), -d);
    vel=new PVector(0, random(2, 6));
    c=color(random(190, 210), 100, 100);
    d=int(random(5, 15));
    acc= new PVector(0, .01);
  }
  void display() {
    noStroke();
    fill(c);
    ellipse(loc.x, loc.y, d, d);
  }
  void move() {
    loc.add(vel);
    vel.add(acc);
  }
  void checkCatcher(Catcher ca) {
    if (loc.dist(ca.loc)<(d/2+ca.d/2)) {
      loc=new PVector(random(d/2, width-d/2), -d);
      vel=new PVector(0, random(2, 6));
    }
  }
}
