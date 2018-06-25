State state;
PFont font1, font2;
void setup() {  
  size(800, 800);
  frameRate(120);
  font1 = createFont("Comic Sans MS", 48, true);
  font2 = createFont("Yu Gothic", 48, true);
  textFont(font2);
  state = new State_Title(1);
}

void draw() {
  state = state.load();
} 
