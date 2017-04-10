PImage img;
PShape lupe;

int mag = 2;

int centrum = 29;
int size = 64;

void setup() {
  size(500, 500);
  imageMode(CENTER);
  shapeMode(CENTER);
  noCursor();
  img = loadImage("botoxL.jpg");
  lupe = loadShape("lupe.svg");
}

void draw() {
  image(img, 250, 250, width, height);
  
  int x = int(1. * mouseX / width * img.width),
  y = int(1. * mouseY / height * img.height);
  
  PImage teil = img.get(x, y, size / mag, size / mag);
  image(teil, mouseX, mouseY, size, size);
  shape(lupe, mouseX + centrum, mouseY + centrum);
}