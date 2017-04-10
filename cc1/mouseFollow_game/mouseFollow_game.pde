// MouseFollow/Easing gamification   example
// Vermeide es, gefangen zu werden.
// Größe des Spielers
int playerSize = 50;
// globale variablen X,Y für die Position des NPC
float npcX = 250;
float npcY = 250;
// globale variable ‘speed’ bestimmt den Schwierigkeitsgrad
float speed = .02;
// globale variable 'caught’ bestimmt den zustand des Spiels
boolean caught = false;
// funktion setup() Wird ein mal beim Start aufgerufen
void setup() {
  size(500, 500);
  noCursor();
  noStroke();
}
// Draw Loop
void draw() {
  // teste ob der npc in sicherer Distanz ist
  // wenn der npc weniger als 'playerSize’ von der Maus entfernt ist
  // wird der Wert der Variable 'caught’ auf 'wahr’ gesetzt;
  // wenn Distanz zwischen maus und npc ist größer als 'playerSize’
  // wird der Wert der Variable 'caught’ auf 'falsch’ gesetzt.
  if (dist(mouseX, mouseY, npcX, npcY) < playerSize) {
    caught = true;
  } else {
    caught = false;
  }
  // wenn 'caught’ wahr ist:
  // zeichne einen roten Hintergrund und weiter nichts.
  // andernfalls, wenn 'caught’ falsch ist, wird das Spiel gezeichnet.
  if (caught) { 
    background(127, 0, 0);
  } else { 
    background(0);
    // zeichne den spieler
    fill(255);
    ellipse(mouseX, mouseY, playerSize, playerSize);
    // Easing https://processing.org/examples/easing.html
    // algorithmus zum aktualisieren der koordinaten des NPC.
    // der folgende code bestimmt das Verhalten des NPC.
    // berechne die Differenz zwischen der position des spielers
    // und der des NPC.
    // für die X-Koordinate:
    float xDiff = mouseX - npcX;
    // addiere einen bruchteil 'speed’ dieser Differenz
    // auf die position des NPC.
    npcX = npcX + xDiff * speed;
    // für die Y-Koordinate:
    float yDiff = mouseY - npcY;
    npcY = npcY + yDiff * speed;
    // zeichne den npc
    fill(0, 127, 0);
    ellipse(npcX, npcY, 50, 50);
  }
  if (mousePressed && frameCount % 2 == 0) {
    saveFrame("###.png");
  }
}