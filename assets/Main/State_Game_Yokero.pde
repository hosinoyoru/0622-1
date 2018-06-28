class State_Game_Yokero extends State {
  Zoog[] zoog;
  Human human;
  Sight sight;
  Time time;
  Count count;
  int stage;
  int t_all;
  int count_all;
  boolean gameclear, gameover;

  State_Game_Yokero(int stage, int count_all, int t_all) {
    this.stage = stage;
    this.count_all = count_all;
    this.t_all = t_all;
    this.zoog = new Zoog[count_all]; 
    zoog[0] = new Zoog_Bouncing( (int)random(width), (int)random(-height, 0));
    for (int i=1; i<zoog.length; i++) {
      zoog[i] = new Zoog_Bouncing( (int)random(width), (int)random(-height, 0));
    }
    human = new Human();
    count = new Count(count_all);
    count.dead = true;
    time  = new Time(t_all, t_state);
    gameclear = false;
    gameover  = false;
  }

  void update() {
    count.count_dead = 0;
    for (Zoog zg : zoog) {
      zg.move();
      if (zg.b_overflow) count.count_dead++;
    }
    
    for (Zoog zg : zoog) { 
      if(human.hit(zg.x, zg.y, zg.w)) gameover = true; // ゲームオーバーの判定
    }
   
    for (Zoog zg : zoog) {
      if ( !zg.overflow ){ break; }    // ゲームクリアの判定
      gameclear = true;
    }
     
    human.follow_x();
    time  = new Time(t_all, t_state);
  }

  void display() {
    background(255);
    for (Zoog zg : zoog)
      zg.display();
    human.display();
    count.display();
    time.display();
  }
  
  State next() {
    if (gameclear) return new State_End_Youwon(stage);
    else if (gameover) return new State_End_Gameover("Fallen Out", stage*1000+count.count_dead*100+time.t_remain*10);
    else if ( time.t_remain<=0  ) return new State_End_Youwon(stage);
    return this;
  }
}
