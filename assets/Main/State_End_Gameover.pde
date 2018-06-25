class State_End_Gameover extends State {
  String cause;
  float score, score_all = 0;

  State_End_Gameover(String cause, float score) {
    this.cause = cause;
    this.score = score;
  }

  void update() {
  }

  void display() {
    background(255);
    textSize(32);
    fill(#0000ff);
    textAlign(CENTER, CENTER);
    text("Game over", width*0.5, height*0.5);
    textSize(20);
    fill(0);
    text(cause, width*0.5, height*0.6);
    text("Score: "+floor(score_all), width*0.5, height*0.7);
    if (t_state > 2) {
      textSize(20);
      fill(0);
      text("Press [R] to return to the title.", width * 0.5, height * 0.4);
    }
  }

  State next() {
    if (t_state > 3 && keyPressed && key == 'r') {
      return new State_Title(1);
    }
    return this;
  }
}
