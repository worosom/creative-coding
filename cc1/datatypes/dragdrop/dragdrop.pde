// x und y -> position des rechtecks
int x = 250;
int y = 250;
// w und h -> dimension des rechtecks
int w = 100;
int h = 100;
boolean inside = false;

// wird ein mal beim start ausgeführt
void setup() {
  size(500, 500);
  rectMode(CENTER);
}

// wird im loop immer wieder ausgeführt
void draw() {
  // println(mouseX > (x - w / 2));
  if (mouseX > x - w / 2 && mouseX < x + w / 2 &&
    mouseY > y - h / 2 && mouseY < y + h / 2) {
    inside = true;
  } else {
    inside = false;
  }
  // wenn die maus innerhalb des rechtecks ist
  // und die maus gedrückt ist, setze die x&y gleich
  // der position der maus
  if (inside) {
    if (mousePressed) {
      x = mouseX;
      y = mouseY;
      fill(255, 0, 0);
    } else {
      fill(0);
    }
  } else {
    fill(255);
  }
  background(255);
  rect(x, y, w, h);
}