Catcher c;
Raindrops[] r;
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
  for (int i=0; i<r.length;i++) {
    r[i].checkCatcher(c);
  }
}

