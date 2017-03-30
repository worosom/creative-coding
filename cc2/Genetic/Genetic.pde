/**
 * "Swarm Intelligence - Evolution of Code"
 *
 * Utilizing a genetic algorithm, this example shows
 * how autonomous vehicles may find their path
 * avoiding obstacles to find a target.
 * Further, the example serves as an elaboration
 * of object oriented programming in Processing.
 *
 * Alexander Morosow, 2017
 * */

int time;
int lifetime = 200;
int populationSize = 500;
PVector origin;

ParticleSystem ps;

void setup() {
  size(500, 500, P2D);
  origin = new PVector(width / 2, height - 10);
  ps = new ParticleSystem(populationSize);
}

void draw() {
  background(255);
  time ++;
  if(time >= lifetime) {
    ps.evaluate();
    ps.selection();
    time = 0;
  }
  ps.update();
  ps.show();
}