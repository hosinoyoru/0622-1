class State_Title extends State {
  Zoog[] zoog;
  int stage;
  int gametype=4;
  
  State_Title(int stage) {
    this.stage = stage;
    this.zoog = new Zoog[stage];
    for (int i=0; i<zoog.length; i++)
      zoog[i] = new Zoog_Stopping(width * 0.5 + (i+1)/2*80*pow(-1, i%2), height * 0.45);
  }
  
  void update() {/* do nothing */
  }
  
  void display() {
    background(255);
    fill(0);
    textSize(32);
    textAlign(CENTER, CENTER);
    if(stage%gametype == gametype-1)
      text("よけろ！", width * 0.5, height * 0.3);
    else if(stage%gametype == gametype-2)
      text("ねらえ！", width * 0.5, height * 0.3);
    else if(stage%gametype == gametype-3)
      text("とべ！", width * 0.5, height * 0.3);
    else
      text("はねかえせ！", width * 0.5, height * 0.3);
    
    textSize(20);
    text("STAGE "+stage, width * 0.5, height * 0.6);
    text("Press [SPACE] to start", width * 0.5, height * 0.7);
    for (int i=0; i<zoog.length; i++) zoog[i].display();
  }

  State next() {
    if (keyPressed && key == ' ') {
      if(stage%gametype == gametype-1)
        return new State_Game_Yokero(stage, stage*6, 10);
      else if(stage%gametype == gametype-2)
        return new State_Game_Nerae(stage, stage*6, 10);
      else if(stage%gametype == gametype-3)
        return new State_Game_Tobe(stage, stage*6, 10);
      else
        return new State_Game_Hanekaese(stage, stage*6, 10);
    }
    return this;
  }
}
