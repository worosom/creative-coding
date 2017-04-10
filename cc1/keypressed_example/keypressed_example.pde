void setup() {
  size(500, 500);
}

void draw() {
}

void keyPressed() {
  if (keyCode == BACKSPACE) {
    background(200);
  } else {
    rect(key, 250, 5, 5);
  }
  if (key == CODED) {
    println(keyCode);
  } else {
    println(key);
  }
} 