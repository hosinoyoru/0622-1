class State_Game_Hanekaese extends State {
  Zoog[] zoog;
  Board board;
  Sight sight;
  Time time;
  Count count;
  int stage;
  int t_all;
  int count_all;
  boolean gameclear, gameover;

  State_Game_Hanekaese(int stage, int count_all, int t_all) {
    this.stage = stage;
    this.count_all = count_all;
    this.t_all = t_all;
    this.zoog = new Zoog[count_all]; 
    this.sight = new Sight();
    board = new Board();
    zoog[0] = new Zoog_Bouncing( (int)random(width), (int)random(-height, 0));
    for (int i=1; i<zoog.length; i++) {
      zoog[i] = new Zoog_Bouncing( (int)random(width), (int)random(-height, 0) % (zoog[i-1].y*100));
      if(i%count_all == 0)
      zoog[i] = new Zoog_Crossing( (int)random(width), (int)random(-height+1,0));
    }
    count = new Count(count_all);
    count.hit = true;
    time  = new Time(t_all, t_state);
    gameclear = false;
    gameover  = false;
  }

  void update() {
    count.count_dead = 0;
    for (Zoog zg : zoog) {
      zg.move();
      if (zg.dead()) count.count_dead++; 
      if ( zg.inframe(mouseX, mouseY)) zg.speed = 2;
      else zg.speed = 1;
      if (zg.overflow(zg)) gameover = true;
      if ( board.hit(zg.x, zg.y+zg.h) ) {
        t_all += 5;
        count.count_hit++;
        zg.boardhit();
        zg.dead = true;
        //if(i%count_all==0)gameover = true;
      }
    }
    for (Zoog zg : zoog) {
        if( !zg.dead() ) break;
        gameclear = zg.dead();
    }
    board.follow_x();
    time  = new Time(t_all, t_state);
  }

  void display() {
    background(255);
    board.display();
    for (Zoog zg : zoog)
      zg.display();
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
