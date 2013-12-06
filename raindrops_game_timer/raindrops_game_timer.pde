Catcher c;
Raindrops[] r;
Timer t;
int score=0;
void setup() {
  size ( 800, 800);
  c=new Catcher();
  r= new Raindrops[1500];
  t =new Timer();
  for (int i=0; i<r.length; i++) {
    r[i]= new Raindrops();
  }
  textSize(32);
}
void draw() {
  background(0);
  c.display();
  t.addDrops(r);
  for (int i=0;i< t.index;i++) {
    r[i].display();
    r[i].move();

    if (r[i].touch(c)) {
      score++;
      r[i].loc.x=2*width;
    }
  }
  text(score, 50, 50);
  println(score);
}

