PShape shape;
int numPoints = 100;

void setup() {
  size(500, 500);

  shape = createShape();
  shape.beginShape();
  shape.noFill();
  for (float i = 0; i < numPoints; i++) {
    float x = sin(i/numPoints*TAU);
    float y = cos(i/numPoints*TAU);
    x += 1.;
    y += 1.;
    x *= 250;
    y *= 250;
    shape.vertex(x, y);
  }
  shape.endShape(CLOSE);
}

void draw() {
  background(255);
  shape(shape, 0, 0);
  
  for (int i = 0; i < shape.getVertexCount(); i++) {
    float x = shape.getVertexX(i);
    float y = shape.getVertexY(i);
    x += random(-.5, .5);
    y += random(-.5, .5);
    shape.setVertex(i, x, y);
  }
}

void mouseClicked() {
}