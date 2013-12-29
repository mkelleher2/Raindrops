//create a class for the timer
class Timer {
  //declare all variables. p indiciates it is for the pig
  int oldt, index, interval, poldt, pindex, pinterval;
  Timer() {
    //initialize all variables
    oldt=0;
    index=0;
    interval=200;
    poldt=0;
    pindex=0;
    pinterval=4000;
  }
  //create a function to add drops referencing a raindrop array
  void addDrops(Corn[] ra) {
    /*if the difference between the current time and the time from before is less than the
     interval, set the old time equal to the current time*/
    if (millis()-oldt>=interval) {
      oldt=millis();
      //if the index is less than the maximum number of raindrops , add one more raindrop
      if (index<ra.length) {
        index++;
      }
    }
  }
  void addPig(Pig[] p1) {
    /*if the difference between the current time and the time from before is less than the
     interval, set the old time equal to the current time*/
    if (millis()-poldt>=pinterval) {
      poldt=millis();
      //if the index is less than the maximum number of ears of corn , add one more ear of corn
      if (pindex<p1.length) {
        pindex++;
      }
    }
  }
}

