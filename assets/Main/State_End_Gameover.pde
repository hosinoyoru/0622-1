class State_End_Gameover extends State {
  String cause;
  int score;
  
    State_End_Gameover(String cause, int score){
      this.cause = cause;
      this.score = score;
    }
  void update() {/* do nothing */
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
    text("Score: "+score, width*0.5, height*0.7);
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
