int  c,x, t, oldt;
void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  c=0;
  rectMode(CENTER);
  noStroke();
  x=100;
}

void draw() {
  t=millis();
  fill(c, 100, 100,50);
  if (t-oldt >1000) {
    c+=60;
    oldt=t;
    x=int(random(30,150));
  }
  if (c==360) {
    c=0;
  }
  rect(mouseX, mouseY, x, x);

}

