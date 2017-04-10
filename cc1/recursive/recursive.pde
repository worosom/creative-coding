void setup() {
  size(500, 500);
  pixelDensity(2);
  strokeWeight(.5);
}

void draw() {
  background(0);
  stroke(255);
  translate(width/2, height/2);
  cross(0, 0, width+250);
}

void cross(float x, float y, float size) {
  pushMatrix();
  translate(x,y);
  line(-size/2, -size/2, size/2, size/2);
  line(size/2, -size/2, -size/2, size/2);
  popMatrix();
  
  rotate(.125*PI);
  if (size > 2) {
    cross(-size/2. + 1/3.*size, 0, size/3.);
    cross(-size/2. + 2/3.*size, 0, size/3.);
    cross(size/2. - 1/3.*size, 0, size/3.);
    cross(size/2. - 2/3.*size, 0, size/3.);
    
    cross(0, -size/2. + 1/3.*size, size/3.);
    cross(0, -size/2. + 2/3.*size, size/3.);
    cross(0, size/2. - 1/3.*size, size/3.);
    cross(0, size/2. - 2/3.*size, size/3.);
  }
}