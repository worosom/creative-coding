// Verschachtelte Schleifen - nested for loops
// Interactive point grid

void setup() {
  size(500, 500);
  stroke(255);
  noCursor();
}

void draw() {
  background(0);

  // for(initialisierung; vergleich; operation){}  
  // schleife für die horizontale
  for (int x = 0; x <= width; x += 10) {
    // schleife für die vertikale
    for (int y = 0; y <= height; y += 10) {
      // initialisiere eine float variable mit dem namen 'weight'
      // welche wird berechnet aus der distanz zwischen maus und punkt
      float weight = dist(mouseX, mouseY, x, y);

      weight /= 500; // weight = weight / 500 normalisiert 
      // weight wird jetzt ungefähr ein wert zwischen 0 und 1 sein
      weight *= 10; // weight = weight * 10.
      strokeWeight(weight);
      point(x, y);
    }
  }
}