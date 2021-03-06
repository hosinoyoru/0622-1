class State_Game_Nerae extends State {
  Zoog[] zoog;
  Board board;
  Sight sight;
  Time time;
  Count count;
  int stage;
  int t_all;
  int count_all;
  boolean gameclear, gameover;

  State_Game_Nerae(int stage, int count_all, int t_all) {
    this.stage = stage;
    this.count_all = count_all;
    this.t_all = t_all;
    this.zoog = new Zoog[count_all]; 
    this.sight = new Sight();
    board = new Board();
    for (int i=0; i<zoog.length; i++)
      zoog[i] = new Zoog_Bouncing( (int)random(width), (int)random(-height, 0) );
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
      if ( zg.dead() ) count.count_dead++;
      if ( mousePressed ) {
        if ( zg.crushed( mouseX, mouseY ) ) zg.speed *= 1.2;
        if ( zg.inframe( mouseX, mouseY ) ) zg.x_d = ((int)random(2)*2-1);
      }
      if ( !mousePressed ) zg.speed = 1;
      
    }


    for (Zoog zg : zoog) {
      if( !zg.crushed ) break;
      gameclear = true; // ゲームクリア
    }

    for (Zoog zg : zoog) {
      if ( zg.b_overflow || !zg.crushed ) gameover = true; // ゲームオーバー
    }
    
    time  = new Time(t_all, t_state);
  }

  void display() {
    background(255);
    //board.display();
    for (Zoog zg : zoog)
      zg.display();
    sight.display();
    count.display();
    time.display();
  }

  State next() {
    if (gameclear) return new State_End_Youwon(stage);
    else if (gameover) return new State_End_Gameover("Fallen Out", stage*1000+count.count_dead*100+time.t_remain*10);
    else if ( time.t_remain<=0  ) return new State_End_Gameover("Times up", stage*1000+count.count_dead*100+time.t_remain*10);
    return this;
  }
}
