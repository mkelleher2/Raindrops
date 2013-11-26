class Raindrops {
  PVector loc;
  PVector vel;
  int d;
  color c;
  Raindrops() {
    colorMode(HSB, 360, 100, 100);
    loc=new PVector(random(d, width-d), random(-5*height, -d));
    vel=new PVector(0, random(2, 6));
    c=color(random(190, 210), 100, 100);
    d=int(random(5, 15));
  }
  void display() {
    noStroke();
    fill(c);
    ellipse(loc.x, loc.y, d, d);
  }
  void move() {
    loc.add(vel);
    if (loc.y>height+d/2) {
      loc.y=-d;
    }
  }
  void checkCatcher(Catcher ca) {
    if (loc.dist(ca.loc)>(d/2+ca.d/2)) {
      display();
      move();
    }
    else {
      d=0;
    }
  }
}

