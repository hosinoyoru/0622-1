class Zoog_Crossing extends Zoog {

  Zoog_Crossing(float x, float y) {
    super(x, y);
  }

  void move() {
    x += random(-1, 1)*speed;
    y += random(-1, 1)*speed;
    y_d = ((int)random(2)*2-1);
    x += x_d * speed;
    y += y_d * speed;
    if ( x>width || x<0 ) x_d *= -1;    //Bounce SideWall
    if ( y<-height ) y_d *= -1;  //Bounce Margin space top
  }
}
