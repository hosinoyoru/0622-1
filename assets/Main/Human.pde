class Human {
  float human_x, human_y, human_r, x_d, xspeed, y_d, yspeed;

  Human() {
    human_x = width * 0.2;
    human_y = height * 0.8;
    human_r = 25;
    x_d = 0;
    y_d = 0;
    xspeed = 0;
    yspeed = 0;
  }
  void update() {/* do nothing */}
  
  void display() {
    fill(200, 200, 0);
    strokeWeight(5);
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

  void move() {
    if ( keyPressed && key == 'a' ) { 
      x_d = -1; 
      xspeed = 2;
    }
    if ( keyPressed && key == 'd' ) { 
      x_d = 1; 
      xspeed = 2;
    } 
    if ( keyPressed && key == ' ' && human_y == height * 0.8) { 
      y_d = -1; 
      yspeed = 6;
    }
    human_x += x_d * xspeed;
    human_y += y_d * yspeed;
    xspeed *= 0.993;                           // slow down because of Air resistance
    if (human_x > width) human_x = width;      // reaching right wall
    if (human_x < 0) human_x = 0;              // reaching left wall
    if (human_y >= height * 0.8 ) { 
      human_y = height * 0.8; 
      yspeed = 0;
    }  // on the ground
    else { 
      y_d += 0.02;
    }                      // falling to the ground
  }

  boolean hit(float x, float y, float r) {
    return (dist(x, y, human_x, human_y) <= r + human_r);
  }
}
