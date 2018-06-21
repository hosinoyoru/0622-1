class Sight {
  void display() {
    strokeWeight(1);
    stroke(200);
    fill(#ffff00);
    line(0, mouseY, width, mouseY);
    line(mouseX, 0, mouseX, height);
    noFill();
    ellipseMode(RADIUS);
    stroke(200);
    ellipse(mouseX, mouseY, 10, 10);
    stroke(200);
    ellipse(mouseX, mouseY, 20, 20);
  }
}