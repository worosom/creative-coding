int lifetime = 400;
// definiere eine Variable "ps" für das Partikel System
ParticleSystem ps;
int counter = 0;

void setup() {
  size(500, 500);
  // initialisiere das Partikel System
  ps = new ParticleSystem(200);
}

void draw() {
  if(counter < lifetime-1) {
    counter ++;
  } else {
    counter = 0;
    ps.evaluate();
    ps.selection();
  }
  background(255);
  // Zeichne das partikel System
  ps.show();
}
