class Timer {
  int oldt, index, interval;
  Timer() {
    oldt=0;
    index=1;
    interval=500;
  }
  void addDrops(Raindrops[] ra) {

    if (millis()-oldt>=interval) {
      oldt=millis();
      index++;
    }
  }
}
