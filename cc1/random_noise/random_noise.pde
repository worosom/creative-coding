/* Zufall und Rauschen / 'perlin' noise() vs. random()
   Zeichnet zwei Graphen um den Unterschied zwischen
   Zufall und Rauschen zu visualisieren.
 * Drücke '+' und '-' um den Detailgrad
   der noise() funktion zu kontrollieren.
 * Bewege den Mauszeiger von links nach
   rechts um zu zoomen.
 */

// Initialisiere eine integer Variable
// mit dem Namen 'detail' und dem Wert '4'.
int detail = 4; 

// Initialisiere eine fliesskomma Variable
// mit dem Namen 'zoom' und dem Wert '1.0'.
float zoom = 1.;

void setup() {
  size(500, 500);
  stroke(255);
  noFill();
}

void draw() {
  // Aktualisiere den Zoom-Wert anhand der Maus-Position.
  // mouseX geht von 0…width. Multiplizere diesen Wert 
  // erst mit 2.0 und dividiere dann durch 'width' um
  // einen Wert von 0…2.0 zu erhalten.
  // Addiere dann 1.0 um einen wert von 1…3 zu erhalten.
  zoom = 1. + 2. * mouseX / width;
  if(zoom < 1)
    zoom = 1;
  print("Zoom: " + zoom);
  
  background(0);
  
  // Zeichne eine horizontale Linie aus 500 punkten.
  // Jeder Punkt wird vertikal um einen zufälligen
  // Wert zwischen -50px und +50px versetzt. 
  beginShape(); // Beginne eine Form zu zeichnen
  // Schleife wird ausgeführt so lange
  // wie 'x' kleiner als 'width' ist.
  // for (INITIALISIERUNG; VERGLEICH; OPERATION){}
  for (int x = 0; x <= width; x++) {
    // Initialisiere eine Variable für
    // die x-Koordniate des Punktes.
    // 'x' zählt von 0 bis 'width' in 1er schritten.
    // Die Multiplikation mit 'zoom' vergrößert
    // den Abstand zwischen den Punkten.
    float xPos = x * zoom;
    // Der Wert '125' legt die vertikale Position des Punktes fest
    float yPos = 125;
    // addiere zu diesem wert eine Zufallszahl zw. -50…50
    yPos += random(-50, 50); // random(high), random(low, high)
    // füge einen Punkt hinzu
    vertex(xPos, yPos);
  }
  endShape(); // Beende die Form
  
  println(" NoiseDetail: " + detail);
  noiseDetail(detail); // Processing-standard ist noiseDetail(4)
  beginShape(); // Beginne eine Form zu zeichnen
  // 
  for (int x = 0; x <= width; x++) {
    // Initialisiere eine Variable für
    // die x-Koordniate des Punktes.
    float xPos = x * zoom;
    // Der Wert '375' legt die vertikale
    // Position des unteren Graphen fest.
    float yPos = 375;
    // generiere eine Zufallszahl aus einer
    // Kontinuierlichen Folge mit hilfe
    // der funktion noise(x), welche
    // einen Wert zw. 0…1 zurückgibt.
    float noise = noise(x/10./zoom);
    // verschiebe diesen Wert um 0.5
    // sodass wir Werte von -0.5…+0,5 erhalten.
    noise -= 0.5;
    // Multipliziere dann mit 100
    // sodass die Zufallswerte von -50…+50 gehen.
    noise *= 100.;
    // Addiere den generierten Zufallswert
    // auf die vertikale Position.
    yPos += noise;
    // Füge einen Punkt hinzu.
    vertex(xPos, yPos);
  }
  endShape(); // Beende die Form
}

void keyPressed() {
  if (key == '+') {
    detail++;
  } else if (key == '-' && detail > 1) {
    detail--;
  }
}