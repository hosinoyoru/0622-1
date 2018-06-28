class State_Title extends State {
  Zoog[] zoog;
  int stage;
  int[] gametype = {1, 2, 3, 4};
  int index = (int)random(gametype.length);

  State_Title(int stage) {
    //textFont(font2);
    this.stage = stage;
    this.zoog = new Zoog[stage];
    for (int i=0; i<zoog.length; i++)
      zoog[i] = new Zoog_Stopping(width * 0.5 + floor((i+1)/2)*80*pow(-1, i%2), width * 0.4);
  }

  void update() {/* do nothing */}
  void display() {
    background(255);
    fill(0);
    textAlign(CENTER, CENTER);
    if (stage == gametype[index%gametype.length]) {
     
      textSize(32);
      text("よけろ！", width * 0.5, height * 0.3);
      textSize(20);
      text("[A] to move left, [D] to move right, [SPACE] to jump", width * 0.5, height * 0.75);
    }
    else if (stage == gametype[index%gametype.length]-1) {
      textSize(32);
      text("ねらえ！", width * 0.5, height * 0.3);
      textSize(20);
      text("Click on Zoog's head", width * 0.5, height * 0.75);
    }
    else if (stage == gametype[index%gametype.length]-2) {
      textSize(32);
      text("とべ！", width * 0.5, height * 0.3);
      textSize(20);
      text("[A] to move left / [D] to move right / [SPACE] to jump", width * 0.5, height * 0.75);
    } 
    else {
      textSize(32);
      text("はねかえせ！", width * 0.5, height * 0.3);
      textSize(20);
      text("Hit Zoog's head on the board", width * 0.5, height * 0.75);
    }
    text("STAGE "+ stage, width * 0.5, height * 0.55);
    text("[SPACE] to start", width * 0.5, height * 0.7);
    for (int i=0; i<zoog.length; i++) zoog[i].display();
  }

  State next() {
    if (keyPressed && key == ' ') {
      if (stage == gametype[index%gametype.length])
        return new State_Game_Yokero(stage, stage*6, 15);
      else if (stage == gametype[index%gametype.length]-1)
        return new State_Game_Nerae(stage, stage*6, 15);
      else if (stage == gametype[index%gametype.length]-2)
        return new State_Game_Tobe(stage, stage*6, 15);
      else
        return new State_Game_Hanekaese(stage, stage*6, 15);
    }
    return this;
  }
}
