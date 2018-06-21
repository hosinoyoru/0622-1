class Count {
  int count_all;
  int count_dead;
  int count_hit;
  int count_remain;

  Count(int count_all) {
    this.count_all = count_all;
  }

  void display() {
    count_remain = count_all - count_dead;
    
    textAlign(LEFT, BOTTOM);
    fill(200);
    
    textSize(22);
    text("hitcount: "+count_hit, width*0.05, height*0.95);
    
    textAlign(RIGHT, BOTTOM);
    text("dead zoog: "+count_remain+"/"+count_all, width*0.95, height*0.95);
  }
}
