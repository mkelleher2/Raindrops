Catcher c;
Raindrops[] r;
int index=1;
int oldt=0;
void setup() {
  size ( 800, 800);
  c=new Catcher();
  r= new Raindrops[15000];
  for (int i=0; i<r.length; i++) {
    r[i]= new Raindrops();
  }
}
void draw() {
  background(0);
  c.display();
  for (int i=0;i< index;i++) {
    r[i].display();
    r[i].move();
    r[i].checkCatcher(c);
  }
  if (millis()-oldt>=10 && index< r.length) {
    index++;
    oldt=millis();
  }
}

