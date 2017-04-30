// initialisiere eine Variable als ArrayList für Vektoren
ArrayList<PVector> points = new ArrayList<PVector>();

void setup() {
  size(500, 500);
}

void update() {
  for(int i = 0; i < points.size(); i++) {
    points.get(i).add(PVector.random2D());
  }
}

void draw() {
  update();
  background(200);
  for(int i = 0; i < points.size(); i++) {
    // hole den Vektor an stelle 'i' in die Variable 'pos'
    PVector pos = points.get(i);
    // zeichne eine ellipse an die koordinaten von 'pos'
    ellipse(pos.x, pos.y, 10, 10);
  }
}

void mousePressed() {
  // füge einen Vektor zur ArrayList hinzu
  points.add(new PVector(mouseX, mouseY));
}