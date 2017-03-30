class ParticleSystem {
  // list for holding all objects that our agents could collide with
  // this includes the target and the obstacles.
  // Collisions with the boundaries of our sketch are handled within the "Auto" class.
  ArrayList<Collider> colliders = new ArrayList<Collider>();
  // Reference to the target our agents are supposed to reach
  Target target;

  // Array for storing the  autonomous agents
  Auto[] particles;
  // list for DNA which is populated when running evaluate()
  // The method selection() then picks random DNA from this list.
  ArrayList<DNA> matingpool = new ArrayList<DNA>();

  //PVector gravity = new PVector(0., .0);

  // Constructor for ParticleSystem class
  ParticleSystem(int numParticles) {
    // initialize an array for storing our autonomous agents
    particles = new Auto[numParticles];
    // create the instances of our agents
    for(int i = 0; i < numParticles; i++) {
      particles[i] = new Auto();
    }
    // create a target for the agents
    target = new Target(width/2, 20, 20);
    // add the target to our list of collidable objects
    colliders.add(target);
    // add obstacles to the list of collidable objects
    colliders.add(new Block(0, height*2./3.-10, width/2, 20));
    colliders.add(new Block(width/2, height/3.-10, width/2, 20));
  }

  void show() {
    // draw collidable objects
    for(int i = 0; i < this.colliders.size(); i++) {
      this.colliders.get(i).show();
    }
    // draw autonomous agents
    for(int i = 0; i < this.particles.length; i++) {
      this.particles[i].show();
    }
  }

  // Calculate the fitness of a Particle
  float calcFitness(Auto a) {
    // initialize the fitness as zero
    float fitness = 0;
    // set the fitness to be relative to the distance from our target
    fitness = PVector.dist(a.pos, target.pos) / height;
    // square fitness value, which is currently just the distance from our target
    //fitness *= fitness;
    // the closer we are to the target, the bigger our fitness value gets
    fitness = 1./fitness;
    // if particle got stuck, multiply the fitness with zero.
    fitness *= a.stuck ? 0 : 1;
    // if particle reached our goal, multiply by two
    fitness *= a.arrived ? 2 : 1;
    // factor in the time the particle took to reach the target
    fitness *= (lifetime - a.age) / lifetime + 1.;
    return fitness;
  }

  // Evaluate the population by calculating the "fitness" of each individual particle,
  // add more DNA of successful particles to the matingpool.
  void evaluate() {
    matingpool.clear();
    float maxFitness = 0;
    for(int i = 0; i < particles.length; i++) {
      float fitness = calcFitness(particles[i]);
      if(fitness > maxFitness)
        maxFitness = fitness;
    }
    for(int i = 0; i < particles.length; i++) {
      int num = (int)(calcFitness(particles[i]) / maxFitness * particles.length);
      for(int j = 0; j < num; j++)
        matingpool.add(new DNA(particles[i].dna.genes));
    }
    println("Max Fitness:", maxFitness);
  }

  // Pick random DNA from the matingpool to generate a new Generation of particles from it.
  void selection() {
    this.particles = new Auto[this.particles.length];
    for(int i = 0; i < particles.length; i ++) {
      DNA pA = matingpool.get((int)random(matingpool.size()));
      DNA pB = matingpool.get((int)random(matingpool.size()));
      if(pA.compare(pB))
        pB = new DNA();
      DNA childDna = pA.crossover(pB);
      if(random(1) > .8)
        childDna.mutate();
      particles[i] = new Auto(childDna);
    }
  }

  void update() {
    // Loop to update position and status of each Particle individually
    for(int i = 0; i < this.particles.length; i++) {
      Auto p = this.particles[i];
      // Only update the particle if it is not stuck and has not arrived at a target
      if(!p.stuck && !p.arrived) {
        p.update();
        p = collide(p);
      }
    }
  }

  // Handle collisions between a Particle and World-objects
  Auto collide(Auto p) {
    // Go through all objects that a particle can collide with
    for(int j = 0; j < colliders.size(); j++) {
      // Check if particle is colliding with collidable object
      if(colliders.get(j).collide(p.pos)) {
        // Determine whether the collidable object is of the type "Block" or "Target"
        if(colliders.get(j) instanceof Target)
          p.arrived = true;
        else if(colliders.get(j) instanceof Block)
          p.stuck = true;
      }
    }
    return p;
  }
}

