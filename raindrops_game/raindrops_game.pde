//declare all classes, arrays, and variables
Catcher c;
Raindrops[] r;
Pig[] p;
Timer t;
PigTimer pt;
StartScreen start;
EndScreen end;
int score, finishedDrops, d, pigsCaught;
float winReq; 
boolean go;
PImage scenery;
void setup() {
  //choose size
  size ( 800, 600);
  //initialize variables, classes, and arrays 
  score=0;
  finishedDrops=0;
  winReq=.9;
  go=false;
  c=new Catcher();
  t =new Timer();
  pt=new PigTimer();
  r= new Raindrops[200];
  p=new Pig[6];
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
  d=0;
  pigsCaught=0;
  scenery=loadImage("scenery.jpg");
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
  if (d==0) {
    go=start.run();
    d++;
  }
}

void game() {
  //set a black background
  scenery.resize(width,height);
  background(scenery);
  //Display and move the catcher
  c.move();
  //have the raindrops display and move
  for (int i=0;i< t.index;i++) {
    r[i].display();
    r[i].move();
    //If the raindrop is touching the catcher, increase score and move raindrop off the screen
    if ( r[i].disp && r[i].touch(c)) {
      score++;
      r[i].disp=false;
      finishedDrops++;
    }
    // When the raindrop hits the bottom of the screen increase the number of finished dots by one
    if ( r[i].disp &&r[i].loc.y>=height) {
      finishedDrops++;
      r[i].disp=false;
    }
  }
  for (int i=0;i< pt.index;i++) {
    p[i].display();
    p[i].move();
    //If the raindrop is touching the catcher, increase score and move raindrop off the screen
    if (p[i].touch(c) && p[i].disp) {
      score-=10;
      p[i].disp=false;;
      pigsCaught++;
    }
  }

  //turn on timer to add drops at defined intervals
  t.addDrops(r);
  pt.addPig(p);
  fill(200,100,100);
  //display score
  text("Score: \n"+ score, 60, 50);
  text("Lives: \n"+ (3-pigsCaught), width-60,50);
  /*When all the dots are finished,and the score is greater than or equal to the
   percentage of the possible score required to win display win screen*/
 end.display(r, c, p);
}

