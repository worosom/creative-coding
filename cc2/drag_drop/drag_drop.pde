int posX = 250;
int posY = 250;

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
  rect(posX, posY, 100, 100);
}

boolean isMouseOver() {
  if (mouseX > posX - 50 && mouseX < posX + 50 &&
    mouseY > posY - 50 && mouseY < posY + 50) {
    return true;
  }
  return false;
}

void mouseDragged() {
  // wird ausgeführt wenn die maus bei gedrückter
  // maustaste bewegt wird
  if(isMouseOver()) {
    posX = posX + (mouseX - pmouseX);
    posY = posY + (mouseY - pmouseY) ;
  }
}