abstract class State {
  float t_point, t_state;
  int strokeweight;
  StringList inventory;

  State() {
    t_point = millis();
  }

  State load() {
    t_state = ( millis() - t_point ) / 1000.0;
    update();
    display();
    return next();
  }

  int[] n_rand(int number){
  IntList nums = new IntList(number);
  for (int i = 0; i < number; i++){
    nums.append(i);
  };
  nums.shuffle();
  int[] result = nums.array();
  return result;
}

  abstract void update();
  abstract void display();
  abstract State next();
}
