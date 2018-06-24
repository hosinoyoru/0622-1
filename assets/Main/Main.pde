State state;
PFont font;

void setup() {  
  size(800, 800);
  frameRate(120);
  font = createFont("rounded-mgenplus-1c-black.ttf", 40);
  textFont(font);
  state = new State_Title(1);
}

void draw() {
  state = state.load();
}
