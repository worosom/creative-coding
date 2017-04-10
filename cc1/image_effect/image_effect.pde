// Initialisiere variable 'img' mit dem Datentyp 'PImage'
// Dieser Datentyp dient zum
PImage img;

void setup() {
  size(500, 500);
  noStroke();

  // Variable "img" zum halten des
  // Bildes festlegen. Bild hinein laden.
  img = loadImage("botox.jpg");
}

void draw() {
  // millis() gibt die zeit seit Start des Sketches in Millisekunden zurück.
  // 1000ms = 1sek, also teile durch 1000.0 um Sekunden zu erhalten.
  float time = millis() / 1000.;
  // Schleife für die Pixelzeilen des Bildes
  for (int px = 0; px < img.width; px++) {
    // Schleife für die Pixelreihen des Bildes
    for (int py = 0; py < img.height; py++) {

      // Farbwert des Bildpixels an der Position px,py
      color c = img.get(px, py);

      // random(1) größer als 0.99 ist
      if (random(1) > .995) {
        // füllfarbe entsprechend des Bildpixels setzen
        fill(c);
        // variable für die größe der ellipse()
        float size = random(1, 4);
        // x- und y-Koordinate der ellipse() gehen aus
        // von der pixel-koordinate des Bildpixels
        float x = px;
        float y = py;
        // addiere einen Wert zur Animation
        x += sin(py/100.+time)*10.;
        y += cos(px/100.+time)*10.;
        // zeichne die ellipse()
        ellipse(x, y, size, size);
      }
    }
  }
}