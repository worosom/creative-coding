class ParticleSystem {
  // Array für "Circle" objekte
  Circle kreis[];

  ParticleSystem(int numParticles) {
    kreis = new Circle[numParticles];
    for (int i = 0; i < kreis.length; i++) {
      // Um eine Instanz der Klasse "Circle" zu erstellen:
      // new Circle(PARAMETER);color(r, g, b) erstellt einen Farbwert
      color c = color(random(255), random(255), random(255));
      kreis[i] = new Circle(random(25), c);
    }
  }

  void show() {
    for (int i = 0; i < kreis.length; i++) {
      kreis[i].show();
    }
  }
}