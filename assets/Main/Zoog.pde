abstract class Zoog {
  float x, y, w, h, eye;
  int x_d, y_d;
  float speed = 1;
  boolean dead, eye_l_crushed, eye_r_crushed, crushed, inframe, l_overflow, r_overflow, t_overflow, b_overflow, overflow;

  Zoog(float x, float y) {
    this.x = x;
    this.y = y;
    x_d = ((int)random(2)*2-1);
    y_d = 1;
    w = 30; 
    h = 30; 
    eye = 16;
    eye_l_crushed = false;
    eye_r_crushed = false;
    crushed = false;
    inframe = false;
    l_overflow = false;
    r_overflow = false;
    t_overflow = false;
    b_overflow = false;
    overflow = false;
    dead = false;
  }
  void update() {/* do nothing */}
  private void display() {
    strokeWeight(1);
    ellipseMode(RADIUS);
    rectMode(CENTER);
    stroke(0);
    fill(255);
    rect(x, y+h, w*2/3, h*5*2/3); // body
    stroke(0);
    fill(inframe ? 100 : 255);
    ellipse(x, y, w, h); // head
    noStroke();
    fill(dead || eye_l_crushed?255:0);
    ellipse(x-w*2/3+1, y, eye/2, eye); // left eye
    fill(dead || eye_r_crushed?255:0);
    ellipse(x+w*2/3-1, y, eye/2, eye); // right eye
    stroke(0);
    line(x-w/3, y+h*8/3, x-w*2/3, y+h*3); // left leg
    line(x+w/3, y+h*8/3, x+w*2/3, y+h*3); // right leg
  }
  
  void boardhit() {
    y_d *= -1;
  }

  boolean inframe(int mx, int my) {
    inframe = (sq(mx - x) + sq(my - y) < sq(w) );
    return inframe;
  }
  
  boolean crushed(int mx, int my) {
    eye_l_crushed = (sq(mx - (x-w*2/3+1))/((eye/2)*(eye/2)) + sq(my - (y))/(eye*eye) < 1);
    eye_r_crushed = (sq(mx - (x+w*2/3+1))/((eye/2)*(eye/2)) + sq(my - (y))/(eye*eye) < 1);
    crushed = (eye_l_crushed && eye_r_crushed);
    return crushed;
  }

  boolean overflow(Zoog zoog) {
    l_overflow = (zoog.x+zoog.w < 0);        // left wall overflow
    r_overflow = (zoog.x-zoog.w > width);   // right wall overflow
    t_overflow = (zoog.y+zoog.h < 0);        // top wall overflow
    b_overflow = (zoog.y-zoog.h > height);   // bottom wall overflow
    overflow  = ( l_overflow || r_overflow || t_overflow || b_overflow );
    return overflow;
  }
  
  boolean dead() {
    dead = (crushed || overflow);
    return dead;
  }
  
  abstract void move();
}
