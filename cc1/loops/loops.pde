// schleifen - loops
// while(){} und for(){}

void setup() {
  size(500, 500);
}

void draw() {
  background(200);

  //line(50, 0, 50, 500);
  //line(100, 0, 100, 500);
  //line(150, 0, 150, 500);

  // while(vergleich){}
  // fange bei 12 an, zähle bis 500 in 25er schritten
  int x = 12; // initialisiere die variable x
  while (x < 500) { // schleife so lange x kleiner als 500 ist
    line(x, 0, x, 500);
    x = x + 25; // erhöht x um 25
  }

  //for(initialisierung; vergleich; operation){}
  // fange bei 25 an, zähle bis 500 in 50er schritten
  for (int y = 25; y < 500; y += 50) { // i = i + 50 oder i += 50
    line(0, y, 500, y);
  }
}