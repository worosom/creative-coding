float zielX = 250;
float zielY = 250;

float x = 0;
float y = 0;

void setup() {
  size(500, 500);
}

void draw() {
  background(255);
  animate(.1);
  ellipse(x, y, 100, 100);
}

void animate(float speed) {
  float distX = zielX - x;
  float distY = zielY - y;
  x += distX * speed;
  y += distY * speed;
}

void mousePressed() {
  zielX = mouseX;
  zielY = mouseY;
}