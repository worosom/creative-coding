class ParticleSystem {
  ArrayList<Particle> particles = new ArrayList<Particle>();
  PVector gravity = new PVector(0., .5);

  ParticleSystem(int numParticles) {
    for(int i = 0; i < numParticles; i++) {
      particles.add(new Particle(random(width), random(height)));
    }
  }

  void update() {
    for(int i = 0; i < this.particles.size(); i++) {
      Particle p = particles.get(i);
      p.accelerate(gravity);
      p.update();
      if(p.pos.x > width)
        p.pos.x = width - p.pos.x;
      if(p.pos.y > height)
        p.pos.y = height - p.pos.y;
    }
  }

  void show() {
    for(int i = 0; i < this.particles.size(); i++) {
      this.particles.get(i).show();
    }
  }
}

