//create a class for the timer
class Timer {
  //declare all variables
  int oldt, index, interval;
  Timer() {
    //initialize all variables
    oldt=0;
    index=1;
    interval=100;
  }
  //create a function to add drops referencing a raindrop array
  void addDrops(Raindrops[] ra) {
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
}

