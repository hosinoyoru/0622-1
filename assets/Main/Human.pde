class Human {
  float human_x, human_y, human_r, xspeed, yspeed;

  Human() {
    human_x = width * 0.5;
    human_y = height * 0.8;
    human_r = 25;
    xspeed = 0;
    yspeed = 0;
  }

  void display() {
    fill(200, 200, 0);
    stroke(100);
    ellipseMode(RADIUS);
    ellipse( human_x, human_y, human_r, human_r );     // head
    line( human_x, human_y+25, human_x, human_y+40 );      // body
    line( human_x, human_y+35, human_x-10, human_y+30 );   // arm_l
    line( human_x, human_y+35, human_x+10, human_y+30 );   // arm_r
    line( human_x, human_y+40, human_x-10, human_y+50 );   // leg_l
    line( human_x, human_y+40, human_x+10, human_y+50 );   // leg_r
  }

  void follow_x() {
    human_x = mouseX;
  }

  void jump() {
    if (keyPressed && key == CODED) {
      if (keyCode == LEFT) xspeed = -3;
      if (keyCode == RIGHT) xspeed = 3;
    }
    human_x += xspeed;
    human_y += yspeed;
    if (human_x > width - 11) human_x = width - 11;
    else if (human_x < 0) human_x = 0;
    if (human_y<350) yspeed += 0.3;
    else { 
      yspeed = 0; 
      human_y = 350;
    }
  }

  void keyPressed() {
    if (key == ' ' && human_y == 350) {
      yspeed = -5;
    }
  }

  boolean hit(float x, float y, float r) {
    return (dist(x, y, human_x, human_y) <= r + human_r);
  }
}
