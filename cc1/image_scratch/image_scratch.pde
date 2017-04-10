PImage img;

void setup() {
  size(500, 500);
  noStroke();
  img = loadImage("botox.jpg");
  println(img.width, img.height);
}

void draw() {
  image(img, 0, 0);
  for (int i = 0; i < img.height; i++) {
    stroke(img.get(0, i));
    line(0, i, mouseX, i);
  }
}