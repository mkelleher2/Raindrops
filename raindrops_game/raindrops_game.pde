//declare all classes, arrays, and variables
Catcher c;
Raindrops[] r;
Pig[] p;
Timer t;
PigTimer pt;
StartScreen start;
EndScreen end;
int score, finishedDrops;
float winReq; 
boolean go;
void setup() {
  //choose size
  size ( 800, 800);
  //initialize variables, classes, and arrays 
  score=0;
  finishedDrops=0;
  winReq=.9;
  go=false;
  c=new Catcher();
  t =new Timer();
  pt=new PigTimer();
  r= new Raindrops[100];
  p=new Pig[3];
  start= new StartScreen();
  end= new EndScreen();
  //initialize each raindrop
  for (int i=0; i<r.length; i++) {
    r[i]= new Raindrops();
  }
  for (int i=0; i<p.length; i++) {
    p[i]= new Pig();
  }
  //establish text size and mode
  textSize(32);
  textAlign(CENTER, CENTER);
  //load the image for the smiley and sad faces and set mode
    colorMode(HSB, 360, 100, 100);
}
void draw() {
  if (go) {
    game();
  }
  if (!go) {
    start.display();
  }
}
void mousePressed() {
  go=start.run();
}
void game() {
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
    // When the raindrop hits the bottom of the screen increase the number of finished dots by one
    if (r[i].loc.y>=height && r[i].loc.y<=2*height) {
      finishedDrops++;
      r[i].loc.y=3*height;
    }
  }
  for (int i=0;i< pt.index;i++) {
    p[i].display();
    p[i].move();
    //If the raindrop is touching the catcher, increase score and move raindrop off the screen
    if (p[i].touch(c)) {
      score-=10;
      p[i].loc.x=2*width;
    }
  }

  //turn on timer to add drops at defined intervals
  t.addDrops(r);
  pt.addPig(p);
  //display score
  text(score, 50, 50);
  /*When all the dots are finished,and the score is greater than or equal to the
   percentage of the possible score required to win display win screen*/
  if (score>=r.length*winReq && finishedDrops==r.length) {
    end.winScreen(c);
  }
  /*When all the dots are finished,and the score is less than the
   percentage of the possible score required to win display lose screen*/
  if (score<r.length*winReq && finishedDrops==r.length) {
    end.loseScreen(c);
  }
}


