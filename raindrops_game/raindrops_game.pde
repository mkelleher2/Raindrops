//declare all classes, arrays, and variables
Catcher c;
Raindrops[] r;
Timer t;
int score;
void setup() {
  //choose size
  size ( 800, 800);
  //initialize variables, classes, and arrays 
  score=0;
  c=new Catcher();
  t =new Timer();
  r= new Raindrops[100];
  //initialize each raindrop
  for (int i=0; i<r.length; i++) {
    r[i]= new Raindrops();
  }
  //establish text size
  textSize(32);
}
void draw() {
  //set a black background
  background(0);
  //Display and move the catcher
  c.move();
  //have the raindrops display and move
  for (int i=0;i< t.index;i++) {
    r[i].display();
    r[i].move();
    //If the raindrop is touching the catcher, increase score and move raindrop off the screen
    if (r[i].touch(c)) {
      score++;
      r[i].loc.x=2*width;
    }
  }
  //turn on timer to add drops at defined intervals
  t.addDrops(r);
  //display score
  text(score, 50, 50);
}
  

