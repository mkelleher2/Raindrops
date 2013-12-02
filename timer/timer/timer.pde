int  c, t, oldt;
void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  c=0;
  rectMode(CENTER);
  noStroke();
}

void draw() {
  t=millis();
  fill(c, 100, 100);
  if (t-oldt >1000) {
    c+=60;
    oldt=t;
  }
  if (c==360) {
    c=0;
  }
  rect(mouseX, mouseY, 100, 100);

}

