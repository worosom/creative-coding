void setup() {
  size(500, 500);
}

void draw() {
  background(255);
  uhr(width/2, height/2, 500);
  String title = hour() + ":" + minute() + ":" + second();
  surface.setTitle(title);
}

void uhr(float x, float y, float size) {
  float h = hour();
  float m = minute();
  float s = second();
  
  pushMatrix();
  translate(x,y);
  stunden(h, size);
  minuten(m, size);
  sekunden(s, size);
  fill(0);
  ellipse(0, 0, size/100, size/100);
  popMatrix();
}

void stunden(float h, float size) {
  pushMatrix();
  rotate(h/12.*TWO_PI);
  strokeWeight(3);
  stroke(0);
  line(0, size/14, 0, -size/4);
  popMatrix();
}

void minuten(float m, float size) {
  pushMatrix();
  rotate(m/60.*TWO_PI);
  strokeWeight(2);
  stroke(0);
  line(0, size/12, 0, -size/2);
  popMatrix();
}

void sekunden(float s, float size) {
  pushMatrix();
  rotate(s/60.*TWO_PI);
  strokeWeight(1);
  stroke(255,0,0);
  line(0, size/12, 0, -size/2);
  popMatrix();
}