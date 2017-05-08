PVector mouse = new PVector();
ParticleSystem ps = new ParticleSystem(100);

void setup() {
  size(500, 500);
  noStroke();
}

void draw() {
  mouse.x = mouseX;
  mouse.y = mouseY;
  fill(200, 20);
  rect(0, 0, width, height);
  //background(200);
  ps.show();
}