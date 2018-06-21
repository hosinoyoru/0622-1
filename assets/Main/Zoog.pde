abstract class Zoog {
  float x, y, w, h, eye;
  int x_d = ((int)random(2)*2-1), y_d = 1;
  float speed = 1;
  boolean eye_l_crushed = false, eye_r_crushed = false;

  Zoog(float x, float y) {
    this.x = x;
    this.y = y;
    w = 30; 
    h = 30; 
    eye = 16;
  }

  void display() {
    ellipseMode(RADIUS);
    rectMode(CENTER);
    stroke(0);
    fill(255);
    rect(x, y+h, w*2/3, h*5*2/3); // body
    stroke(0);
    fill(255);
    ellipse(x, y, w, h); // head
    noStroke();
    fill(eye_l_crushed?255:0);
    ellipse(x-w*2/3+1, y, eye/2, eye); // left eye
    fill(eye_r_crushed?255:0);
    ellipse(x+w*2/3-1, y, eye/2, eye); // right eye
    stroke(0);
    line(x-w/3, y+h*8/3, x-w*2/3, y+h*3); // left leg
    line(x+w/3, y+h*8/3, x+w*2/3, y+h*3); // right leg
  }
  
  void crushed(int mx, int my){
    if (sq(mx - (x-w*2/3+1))/((eye/2)*(eye/2)) + sq(my - (y))/(eye*eye) < 1) 
      eye_l_crushed = true;
    if (sq(mx - (x+w*2/3+1))/((eye/2)*(eye/2)) + sq(my - (y))/(eye*eye) < 1) 
      eye_r_crushed = true;  
  }
  
  boolean dead() {
      return (eye_l_crushed && eye_r_crushed);
  }

  boolean overflow(Zoog zoog) {
    return (zoog.y-zoog.h*2>height && !dead());
  }

  abstract void move();
}
