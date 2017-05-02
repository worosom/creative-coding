PVector mouse = new PVector();
// definiere eine Variable "ps" für das Partikel System
ParticleSystem ps;

void setup() {
  size(500, 500);
  noStroke();
  // initialisiere das Partikel System
  ps = new ParticleSystem(50);
}

void draw() {
  // speichere die Koordinaten der Maus im Vektor "mouse"
  mouse.x = mouseX;
  mouse.y = mouseY;
  background(255);
  // Zeichne das partikel System
  ps.show();
}