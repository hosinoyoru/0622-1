class State_Game_Tobe extends State {
  Zoog[] zoog;
  Human human;
  Sight sight;
  Time time;
  Count count;
  int stage;
  int t_all;
  int count_all;
  boolean gameclear, gameover;

  State_Game_Tobe(int stage, int count_all, int t_all) {
    this.stage = stage;
    this.count_all = count_all;
    this.t_all = t_all;
    this.zoog = new Zoog[count_all]; 
    //this.sight = new Sight();
    //board = new Board();
    zoog[0] = new Zoog_Crossing( (int)random(width), (int)random(-height, 0));
    for (int i=1; i<zoog.length; i++) {
      zoog[i] = new Zoog_Bouncing( (int)random(width), (int)random(-height, 0) % (zoog[i-1].y*100));
      //if(i%count_all == 0)
      //zoog[i] = new Zoog_Jiggling( (int)random(width), (int)random(-height+1,0), board );
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
      if (zg.dead()) count.count_dead++; 
    }
    
    for (Zoog zg : zoog) {
      if (human.hit(zg.x, zg.y, zg.w)) gameover = true; // ゲームオーバー
    }
    
    for (Zoog zg : zoog) {
      if ( !(zg.l_overflow || zg.b_overflow) )break; // ゲームクリア
      gameclear = true;
    }
    
    human.move();

    time  = new Time(t_all, t_state);
  }

  void display() {
    background(255);
    line(0, height*0.8, width, height*0.8);
    //board.display();
    for (int i=0; i<zoog.length; i++)
      zoog[i].display();
    human.display();
    //sight.display();
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
