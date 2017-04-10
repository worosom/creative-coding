PImage img;
 
// die Breite und Höhe einer Kachel,
// diese berechnen wir über die Anzahl der
// Zeilen und Spalten
int gridStepX;
int gridStepY;
 
// aus wieviel Zeilen und Spalten besteht
// das Gittermuster
int zeilen = 5;
int spalten = 5;
 
void setup() {
  // Grösse der Anwendung = Grösse des Bildes
  size(500, 500);
   
  // Bild laden  
  img = loadImage("botox.jpg");
   
  // Größe der Kachel berechnen
  // Größe = Gesamtgröße / Anzahl der Spalten
  gridStepX = width / zeilen;
  gridStepY = height / spalten;
}
 
void draw() {
  // wir "schneiden" uns unser Kachelstück
  // an der aktuellen Mausposition heraus,
  // und speichern dies in einem neuen Bild
  PImage imgPart = img.get(mouseX, mouseY, gridStepX, gridStepY);
   
  // gehe in 'Kachelschritten' entlang der Breite
  for (int x=0; x < width; x += gridStepX) {
    // gehe in 'Kachelschritten' entlang der Höhe
    for (int y=0; y < width; y += gridStepY) {
      // zeichne das aktuelle Kachelbild an
      // der jeweiligen Stelle
      image(imgPart, x, y, gridStepX*2, gridStepX*2);
    }
  }
}