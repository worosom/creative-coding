class Particle {
  PVector pos = new PVector();
  PVector vel = new PVector();
  PVector acc = new PVector();
  float drag = .85;

  Particle(float x, float y) {
    this.pos.x = x;
    this.pos.y = y;
  }

  void update() {
    this.vel.add(acc);
    this.acc.mult(0.);

    this.pos.add(vel);
    this.vel.mult(drag);

    accelerate(PVector.random2D().mult(.1));
  }

  void accelerate(PVector direction) {
    this.acc.add(direction);
  }

  void show() {
    line(this.pos.x, this.pos.y, this.pos.x+this.vel.x, this.pos.y+this.vel.y);
  }
}

