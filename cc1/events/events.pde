/* Events / Ereignisse
Ereignisse erlauben es Maus- und Tastatur-Interaktion
außerhalb der 'void draw(){}' Schleife zu definieren.
*/

// Variable mit dem namen 'weight' für die Dicke des Randes
// DATENTYP NAME = WERT;
int weight = 1;

void setup() {
  size(500, 500);
}

void draw() {
  background(200); // Zeichne den Hintergrund
  strokeWeight(weight); // Aktualisiere die Dicke der Umrandung
  ellipse(mouseX, mouseY, 100, 100); // Zeichne eine ellipse()
  saveFrame("###.png");
}

void keyPressed() {
  // alles was hier drin steht wird ausgeführt
  // wenn eine taste auf der tastatur gedrückt wurde
  if (key == 'c') {
    fill(63, 78, 127); // fülle blau wenn 'c' gedrückt wurde
  } else if (key == '+') {
    weight++; // erhöhe die Randdicke um 1px
  } else if (key == '-' && weight > 0) {
    weight--; // verringere die Randdicke um 1px
  }
}

/*
Mouse Events:
mouseClicked()
mouseDragged()
mouseMoved()
mousePressed()
mousePressed
mouseReleased()
mouseWheel()
*/

void mousePressed() {
  // alles was hier drin steht wird ausgeführt wenn
  // eine maustaste gedrückt wurde
  if (mouseButton == LEFT) {
    fill(0);
  } else {
    fill(127);
  }
}

void mouseReleased() {
  // wird ausgeführt wenn eine maustaste
  // losgelassen wurde.
  fill(255);
}

void mouseDragged() {
  // wird ausgeführt wenn die maus mit
  // gedrückter maustaste bewegt wird
  fill(255, 0, 0);
}