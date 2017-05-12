/**
 * Particle class implementing a particle which
 * accelerates in a direction specified by its DNA.
 */
class Particle {
  // position vector
  PVector pos;
  // velocity vector
  PVector vel;
  // the velocity vector gets multiplied by the drag coefficient
  // every time the update method gets called.
  float drag = .9;
  // dna variable for holding the particle's instance of DNA
  DNA dna;
  // flag whether the particle collided with the walls or an obstacle
  boolean stuck = false;
  // flag whether the particle arrived at the target
  boolean arrived = false;

  /**
   * Particle constructor for initializing a particle
   * with random DNA and a lifetime specified by the
   * global sketch variable 'lifetime'.
   *
   * @param x initial horizontal positon
   * @param y initial vertical position
   */
  Particle(int x, int y) {
    this.pos = new PVector(x, y);
    this.vel = new PVector();
    // call the constructor to initialize random DNA
    this.dna = new DNA(lifetime);
  }

  /**
   * Particle update method.
   */
  void update() {
    // accelerate the particle in the direction specified by its dna instance
    accelerate(this.dna.genes[counter]);
    // add the velocity to our position to get an updated position
    pos.add(vel);
    // apply coefficient of drag
    vel.mult(drag);
  }

  /**
   * Adds an acceleration vector to the velocity vector of the particle.
   *
   * @param acc Vector for accelerating the particle.
   */
  void accelerate(PVector acc) {
    vel.add(acc);
  }

  void show() {
    float x1 = pos.x, y1 = pos.y,
    x2 = pos.x+vel.x, y2 = pos.y+vel.y;

    stroke(0);
    line(x1, y1, x2, y2);
  }
}
