int numlines = 500;

void setup() {
  size(500, 500);
  colorMode(HSB);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  rotate(millis()/1000.);
  for(int i = 0; i < numlines; i++) {
    rotate(1. / numlines * TWO_PI);
    stroke(float(i) / numlines * 255, 255, 255);
    line(0, 0, width/2, 0);
  }
} 