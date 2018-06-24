/* @pjs preload="data/Splatfont-32.vlw"; */ 
State state;
PFont font;

void setup() {  
  size(800, 800);
  frameRate(120);
  font = loadFont("Splatfont-32.vlw");
  textFont(font);
  state = new State_Title(1);
}

void draw() {
  state = state.load();
}
