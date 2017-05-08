class ParticleSystem {
  Circle particles[];

  //Konstruktor
  ParticleSystem(int numParticles) {
    particles = new Circle[numParticles];
    for (int i = 0; i < particles.length; i++) {
      color c = color(random(255), random(255), random(255));
      particles[i] = new Circle(250, 250, c);
    }
  }

  void show() {
    //for(INITIALISIERUNG; BEDINGUNG; OPERATION) {CODE}
    for (int i = 0; i < particles.length; i++) {
      particles[i].show();
    }
  }
}