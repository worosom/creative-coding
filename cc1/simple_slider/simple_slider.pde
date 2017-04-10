float value = 0.;

void setup() {
  size(500, 500);
}

void draw() {
  background(255*value);
  drawSlider(0, 0, 500);
  if(frameCount%10==0)
    println(value);
}

void drawSlider(float x, float y, float w) {
  if(mousePressed) {
    if(mouseX >= x && mouseX <= x+w) {
      if(mouseY > y && mouseY < y + 30) {
        value = (mouseX - x) / w;
      }
    }
  }
  noStroke();
  fill(200);
  rect(x, y, w, 30);
  fill(0);
  rect(x+value*(w-10), y, 10, 30);
}