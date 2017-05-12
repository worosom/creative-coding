/**
 *  Genetic Algorithm
 *  Part 1
 */

// number of particles in the system
int particleCount = 100;
// lifetime of the particles
int lifetime = 250;
// global variable for timekeeping
// initialized at zero, counting up
int counter = 0;
// variable for holding the ParticleSystem instance
ParticleSystem ps;

void setup() {
  size(500, 500);
  strokeWeight(2);
  // Call the Constructor of the ParticleSystem class and
  // save the resulting Object in variable 'ps'
  ps = new ParticleSystem(particleCount);
}

/**
 * update method of this sketch.
 * Adds 1 to the global variable 'counter' if lower than 'lifetime-1'.
 * Else resets 'counter' to 0 and initializes a new generation of particles.
 * Then calls the update method of the ParticleSystem instance.
 */
void update() {
  if(counter < lifetime-1) {
    //increment counter
    counter++;
  } else {
    // reset counter
    counter = 0;
    // initialize a new generation of particles
    ps = new ParticleSystem(particleCount);
  }
  ps.update();
}

void draw() {
  // call the update method of this sketch
  update();
  background(200);
  // call the show method of the ParticleSystem instance
  ps.show();
}
