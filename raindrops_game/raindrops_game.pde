//declare all classes, arrays, integers, floats, booleans, and images
Catcher c;
Timer t;
StartEndScreen screen;
Corn[] corn;
Pig[] pig;
int score, finishedDrops, lives;
float winReq;
boolean go, triggered;
PImage scenery, cornPic, pigPic, happy, sad, cloud, catcher;
void setup() {
  //set a size for the drawing
  size ( 800, 600);
  //set initial score to zero and lives to three
  score=0;
  lives=3;
  // set the fraction of the number of ears of corn the player must catch in order to win
  winReq=.5;
  //set the number of drops already completed to 0
  finishedDrops=0;
  //initialize all other variables, classes, and arrays
  c=new Catcher();
  t =new Timer();

  corn= new Corn[10];
  pig=new Pig[6];
  screen= new StartEndScreen();
  for (int i=0; i<corn.length; i++) {
    corn[i]= new Corn();
  }
  for (int i=0; i<pig.length; i++) {
    pig[i]= new Pig();
  }
  //load all the images in the program
  scenery=loadImage("scenery.jpg");
  cornPic=loadImage("corn.png");
  pigPic=loadImage("pig.png");
  happy=loadImage("smile.png");
  sad=loadImage("frown.png");
  cloud=loadImage("cloud.png");
  catcher=loadImage("catcher.png");
  //set text size to 32 pixels and make it align to the center
  textSize(32);
  textAlign(CENTER, CENTER);
  //set the color mode to HSB and turn off the stroke
  colorMode(HSB, 360, 100, 100);
  noStroke();
}
void draw() {
  //if the boolean go is true, start the game
  if (go) {
    //set the background image
    scenery.resize(width, height);
    background(scenery);
    //turn on the catcher
    c.move(catcher);
    //turn on the timers to add corn and pigs
    t.addDrops(corn);
    t.addPig(pig);
    for (int i=0;i< t.index;i++) {
      //show and move the corn
      corn[i].display(cornPic);
      corn[i].move();
      /*if the corn is on the screen and is touching the top of the catcher, increase the score, 
       make the corn not display, and increase the number of completed drops*/
      if ( corn[i].disp && corn[i].touch(c)) {
        score++;
        corn[i].disp=false;
        finishedDrops++;
      }
      /*if the corn is displayed and touches the bottom of the screen, make it not 
       display and increase the number of completed drops*/
      if ( corn[i].disp &&corn[i].loc.y>=height) {
        finishedDrops++;
        corn[i].disp=false;
      }
    }
    for (int i=0;i< t.pindex;i++) {
      //show and move the pigs
      pig[i].display(pigPic);
      pig[i].move();
      /*if the pig is displayed and touches the top of the catcher, decrease the score,
       stop displaying the pig, and decrease lives*/
      if (pig[i].touch(c) && pig[i].disp) {
        score-=5;
        pig[i].disp=false;
        lives--;
      }
    }
    //make two rectangles that display the score and lives remaining
    fill(60, 100, 100);
    rect(50, 50, 110, 100);
    rect(width-60, 50, 120, 110);
    fill(240, 100, 100);
    text("Score: \n"+ score, 60, 50);
    text("Lives: \n"+ lives, width-60, 50);
    //turn on the end screen when applicable
    screen.displayEnd(corn, c, pig, scenery, lives);
  }
  //if the boolean go is not made true, display the startscreen
  if (!go) {
    screen.displayStart(cloud);
  }
}
//if the mouse is pressed, check if the boolean triggered is false, and if not, start the game and set the boolean to true
void mousePressed() {
  if (!triggered) {
    go=screen.run();
    triggered=true;
  }
}
/*create a reset button (the r button) that when pressed will bring all variables back
to their original settings and reload the background*/
void keyPressed() {
  if (key=='r') {
    score=0;
    lives=3;
    finishedDrops=0;
    triggered=false;
    go=false;
    t.index=0;
    t.pindex=0;
    c=new Catcher();
    t =new Timer();
    corn= new Corn[100];
    pig=new Pig[6];
    screen= new StartEndScreen();
    for (int i=0; i<corn.length; i++) {
      corn[i]= new Corn();
    }
    for (int i=0; i<pig.length; i++) {
      pig[i]= new Pig();
    }
    scenery=loadImage("scenery.jpg");
  }
}

