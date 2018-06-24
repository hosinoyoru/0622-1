abstract class State {
  float t_point;
  float t_state;
  int strokeweight;
  State() {
    t_point = millis();
  }

  State load() {
    t_state = ( millis() - t_point ) / 1000.0;
    update();
    display();
    return next();
  }
  abstract void update();
  abstract void display();
  abstract State next();
}
