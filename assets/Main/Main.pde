State state;
PFont font;
void setup() {  
  size(800, 800);
  frameRate(120);
  font = createFont("Splatfont", 48, true);
  textFont(font);
  state = new State_Title(1);
}

void draw() {
  state = state.load();
} 
