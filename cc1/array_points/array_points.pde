// Initialisiere eine Array Variable mit Platz für 1000 Elemente
float[] pos = new float[1000];

void setup() {
  size(500, 500);
}

void draw() {
  background(255);
  
  for(int i = 0; i < pos.length; i++) {
    pos[i] += random(10);
    if(pos[i] > width)
      pos[i] = 0;
  }
  
  maleKreise();
}

void maleKreise() {
  for(int i = 0; i < pos.length; i++) {
    float x = pos[i];
    float y = float(i) / pos.length * height;
    ellipse(x, y, 5, 5);
  }
}