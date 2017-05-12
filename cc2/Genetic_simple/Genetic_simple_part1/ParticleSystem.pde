class ParticleSystem {
  Particle particles[];
  Obstacle target;

  //Konstruktor
  ParticleSystem(int numParticles) {
    particles = new Particle[numParticles];
    for (int i = 0; i < particles.length; i++) {
      color c = color(random(255), random(255), random(255));
      particles[i] = new Particle(250, 250, c);
    }
    target = new Obstacle(235, 50, 25, 25); 
  }
  
  void update() {
    for (int i = 0; i < particles.length; i++) {
      if(!particles[i].stuck && !particles[i].arrived) {
        if(target.collide(particles[i].pos)) {
          particles[i].arrived = true;
        }
        particles[i].update();
      }
    }
  }

  void show() {
    target.show();
    //for(INITIALISIERUNG; BEDINGUNG; OPERATION) {CODE}
    for (int i = 0; i < particles.length; i++) {
      particles[i].show();
    }
  }
}