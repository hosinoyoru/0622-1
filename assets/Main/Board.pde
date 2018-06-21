class Board {
  float board_x1, board_y1, board_x2, board_y2, board_w, board_h;

  Board() {
    board_x1 = width * 0.5;
    board_y1 = height * 0.95;
    board_w  = 100;
    board_h  = 0.01;
    board_x2 = board_x1+board_w;
    board_y2 = board_y1+board_h;
  }

  void display() {
    stroke(0);
    fill(255);
    rectMode(CORNERS);
    rect(board_x1, board_y1, board_x2, board_y2);
  }

  void follow_x() {
    board_x1 = mouseX - abs(board_x1-board_x2)*0.5;
    board_x2 = mouseX - abs(board_x1-board_x2)*0.5 + board_w;
  }
  
  boolean hit(float x, float y) {
    return (x>=board_x1 && x<=board_x2 && y>=board_y1 && y<=board_y2);
  }
}
