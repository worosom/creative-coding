PShape shape;
int numPoints = 10;

void setup() {
  size(500, 500);

  shape = createShape();
}

void draw() {
  background(255);
  shape(shape, 0, 0, width, height);
  
  for (int i = 0; i < shape.getVertexCount(); i++) {
    float x = shape.getVertexX(i);
    float y = shape.getVertexY(i);
    x += random(-1, 1);
    y += random(-1, 1);
    shape.setVertex(i, x, y);
  }
}

void mouseClicked() {
  shape.beginShape();
  shape.noFill();
  for (int i = 0; i < numPoints; i++) {
    shape.vertex(random(500), random(500));
  }
  shape.endShape();
}