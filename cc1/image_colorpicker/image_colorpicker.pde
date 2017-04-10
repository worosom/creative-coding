PImage img;

void setup() {
  size(500, 500);
  noStroke();
  img = loadImage("botox.jpg");
  println(img.width, img.height);
}

void draw() {
  color c = img.get(mouseX, mouseY);
  image(img, 0, 0);
  fill(c);
  rect(0, 375, 125, 125);
}