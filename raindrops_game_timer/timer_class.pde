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
  void addDrops(Raindrops[] ra) {
//if the difference between the current time and the time from before is less than the interval
    if (millis()-oldt>=interval) {
      oldt=millis();
      if (index<ra.length) {
        index++;
      }
    }
  }
}

