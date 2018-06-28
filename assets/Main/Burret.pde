class Burret {
  float burret_x, burret_y, burret_w, burret_h;

  Burret() {
  }
  
  void update() {/* do nothing */}

  void display() {
    ellipseMode(CENTER);
    ellipse(burret_x, burret_y, burret_w, burret_h);
  }
}
