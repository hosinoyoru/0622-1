class Count {
  int count_all, count_dead, count_hit, count_remain;
  boolean dead, hit;

  Count(int count_all) {
    this.count_all = count_all;
    dead = false;
    hit = false;
  }

  void display() {
    fill(200);
    textSize(22);
    if (dead) {
      count_remain = count_all - count_dead;
      textAlign(RIGHT, BOTTOM);
      text("dead zoog: "+count_remain+"/"+count_all, width*0.95, height*0.95);
    }

    if (hit) {
      textAlign(LEFT, BOTTOM);
      text("hit: "+count_hit, width*0.05, height*0.95);
    }
  }
}
