class Catcher {
  PVector loc;
  int d;
  Catcher() {
    loc= new PVector(mouseX, height-100);
    d=200;
    colorMode(RGB, 255, 255, 255);
  }
  void display() {
    fill(255);
    ellipse(loc.x, loc.y, d, d);
    loc.x=mouseX;
  }
}

