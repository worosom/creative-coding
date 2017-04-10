void setup() {
  size(500, 500);
  noFill();
}

void draw() {
  background(255);
  translate(width/2, height/2);
  ellipsis(0,0,500);
}

void ellipsis(float x, float y, float size) {
  rotate(QUARTER_PI); 
  ellipse(x, y, size, size);
  if(size > 4) {
    ellipsis(x, y, size / 3);
    ellipsis(x - size/3, y, size / 3);
    ellipsis(x + size/3, y, size / 3);
    ellipsis(x, y - size/3, size/3);
    ellipsis(x, y + size/3, size/3);
  }
}