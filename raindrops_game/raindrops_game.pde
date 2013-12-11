//declare all classes, arrays, and variables
Catcher c;
Raindrops[] r;
Timer t;
int score, finishedDrops;
PImage happy,sad;
float winReq;
void setup() {
  //choose size
  size ( 800, 800);
  //initialize variables, classes, and arrays 
  score=0;
  finishedDrops=0;
  winReq=.9;
  c=new Catcher();
  t =new Timer();
  r= new Raindrops[100];
  //initialize each raindrop
  for (int i=0; i<r.length; i++) {
    r[i]= new Raindrops();
  }
  //establish text size and mode
  textSize(32);
  textAlign(CENTER);
  //load the image for the smiley and sad faces and set mode
  happy=loadImage("smile.png");
  sad=loadImage("frown.png");
  imageMode(CENTER);
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
    // When the raindrop hits the bottom of the screen increase the number of finished dots by one
    if (r[i].loc.y>=height && r[i].loc.y<=2*height) {
      finishedDrops++;
      r[i].loc.y=3*height;
    }
  }
  //turn on timer to add drops at defined intervals
  t.addDrops(r);
  //display score
  text(score, 50, 50);
  println(finishedDrops);
  /*When all the dots are finished,and the score is greater than or equal to the
  percentage of the possible score required to win display win screen*/ 
  if (score>=r.length*winReq && finishedDrops==r.length) {
    winScreen();
  }
  /*When all the dots are finished,and the score is less than the
  percentage of the possible score required to win display lose screen*/ 
  if (score<r.length*winReq && finishedDrops==r.length) {
    loseScreen();
  }
}
void winScreen() {
  //display congratulatory text
  text("You win a Case of Satisfaction!!!!", width/2, height/2);
  //make the catcher invisible
  c.d=0;
  //display the smiley face in the place of the catcher
  image(happy, mouseX, height-100, 200, 200);
}
void loseScreen(){
  //display uncongratulatory text
  text("wow.... I guess the answer wasn't in the pdf", width/2, height/2);
  //make the catcher invisible
  c.d=0;
  //display the sad face in the place of the catcher
  image(sad, mouseX, height-100, 200, 200);
}
  

