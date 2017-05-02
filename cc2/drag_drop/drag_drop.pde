int size = 50;
int posX = 250;
int posY = 250;
boolean locked = false;

// setup() wird ein mal beim start ausgeführt
void setup() {
  size(500, 500);
  rectMode(CENTER);
  noStroke();
  fill(0);
}

// draw() wird als loop bspw. 60 mal/sek ausgeführt
void draw() {
  background(255);
  if (isMouseOver()) {
    fill(127, 50, 50);
  } else {
    fill(0);
  }
  rect(posX, posY, size, size);
}

boolean isMouseOver() {
  if (mouseX > posX - size/2 && mouseX < posX + size/2 &&
    mouseY > posY - size/2 && mouseY < posY + size/2) {
    return true;
  }
  return false;
}

void mouseReleased() {
  locked = false;
}

void mouseDragged() {
  // wird ausgeführt wenn die maus bei gedrückter
  // maustaste bewegt wird
  if(isMouseOver() || locked) {
    locked = true;
    posX = posX + (mouseX - pmouseX);
    posY = posY + (mouseY - pmouseY) ;
  }
}