/**
 * ParticleSystem class implementing a particle system and collisions.
 */
class ParticleSystem {
  Particle particles[];
  Obstacle target;

  /**
   * Constructor for initializing a particle system with a number of particles
   * specified by the passed integer parameter.
   *
   * @param numParticles number of particles contained by this system
   */
  ParticleSystem(int numParticles) {
    // initialize an array to hold the particles
    particles = new Particle[numParticles];
    // fill the array with Particle instances.
    // by calling the Particle constructor for every place in the particle array
    for (int i = 0; i < particles.length; i++) {
      particles[i] = new Particle(250, 250);
    }
    // initialize the target by creating an instance of an Obstacle
    target = new Obstacle(235, 50, 25, 25);
  }

  /**
   * Method for updating the particles by looping through the particle array,
   * calling each particle's update method and checking for collisions.
   */
  void update() {
    // for loop to go through every particle instance
    for (int i = 0; i < particles.length; i++) {
      // save current particle instance in local variable 'p'
      Particle p = particles[i];
      // check collision flags of the particle
      // and only continue if BOTH flags are false
      if(!p.stuck && !p.arrived) {
        // call the update method of the particle
        p.update();
        // check if particle has arrived at the target
        if(target.collide(p.pos)) {
          p.arrived = true;
        }
        // If particle hits the walls of the sketch, get stuck.
        if(p.pos.x > width || p.pos.x < 0 ||
          p.pos.y > height || p.pos.y < 0) {
          p.stuck = true;
        }
      }
    }
  }

  void show() {
    // draw target shape
    target.show();
    //for(INITIALISIERUNG; BEDINGUNG; OPERATION) {CODE}
    for (int i = 0; i < particles.length; i++) {
      // draw particles
      particles[i].show();
    }
  }
}
