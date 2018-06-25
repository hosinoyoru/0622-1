class Zoog_Bouncing extends Zoog {

  Zoog_Bouncing(float x, float y) {
    super(x, y);
  }

  void move() {
    x += x_d * speed;
    y += y_d * speed;
    if ( x>width || x<0 ) x_d *= -1;    //Bounce SideWall
  }
}
