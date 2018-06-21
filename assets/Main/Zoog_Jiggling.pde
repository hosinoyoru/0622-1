class Zoog_Jiggling extends Zoog {
  int x_d = ((int)random(2)*2-1), y_d = 1;
  float speed = 1;
  Board board;

  Zoog_Jiggling(float x, float y, Board board) {
    super(x, y);
    this.board = board;
  }

  void move() {
    x += random(-3, 3)*speed;
    y += random(-3, 3)*speed;
    x += x_d * speed;
    y += y_d * speed;
    if ( x>width || x<0 ) x_d *= -1;    //Bounce SideWall
    if ( y<-height ) y_d *= -1;  //Bounce Margin space top
    
    if ( board.hit(x, y) )
      y_d *= -1;            //Bounce on Board
  }
}
