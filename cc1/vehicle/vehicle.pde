PVector position;
PVector target;
PVector velocity;

float force = .05;
float drag = .99;

void setup() {
  size(500, 500);
  
  
  position = getRandomPoint();
  target = getRandomPoint();
  velocity = new PVector(0, 0);
}

void draw() {
  background(255);
  update();
  fill(0);
  line(position.x, position.y, position.x + velocity.x*20., position.y+velocity.y*20.);
  fill(255, 0, 0);
  ellipse(target.x, target.y, 5, 5);
}

void mousePressed() {
  target = new PVector(mouseX, mouseY);
}

void update() {
  PVector direction = getDirection();
  applyForce(direction);
  position.add(velocity);
  velocity.mult(drag);
}

void applyForce(PVector direction) {
  direction.mult(force);
  velocity.add(direction);
}

PVector getDirection() {
  PVector dir = target.copy();
  dir.sub(position);
  if (dir.mag() > 4.) {
    dir.normalize();
    return dir;
  } else {
    target = getRandomPoint();
    return new PVector(0, 0);
  }
}

PVector getRandomPoint() {
  return new PVector(random(125,375), random(125,375));
}