class Time {
  int t_all;
  int t_state;
  int t_remain;

  Time(int t_all, float t_state) {
    this.t_all  = t_all;
    this.t_remain = (int)((float)t_all - t_state);
  } 
  void update() {/* do nothing */}
  void display() {
    textSize(80);
    fill(#ffa500);
    textAlign(CENTER, CENTER);
    if (t_remain <= 5) fill( random(255), random(255), random(255) );
    text(t_remain, width*0.5, height*0.5);
  }
}
