ParticleSystem ps;

void setup() {
  size(500, 500, P2D);
  ps = new ParticleSystem(1000);
}

void draw() {
  background(255);
  ps.update();
  ps.show();
}

