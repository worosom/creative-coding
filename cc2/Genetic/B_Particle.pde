class Particle {
  PVector pos = new PVector();
  PVector vel = new PVector();
  PVector acc = new PVector();
  float drag = .9;

  Particle(float x, float y) {
    this.pos.x = x;
    this.pos.y = y;
  }

  void update() {
    this.vel.add(acc);
    this.acc.mult(0.);

    this.pos.add(vel);
    this.vel.mult(drag);
  }

  void accelerate(PVector direction) {
    this.acc.add(direction);
  }

  void show() {
    line(this.pos.x, this.pos.y, this.pos.x+this.vel.x, this.pos.y+this.vel.y);
  }
}

class Auto extends Particle {
  DNA dna;
  boolean arrived = false;
  boolean stuck = false;
  int age = 0;

  Auto() {
    this(new DNA());
  }

  Auto(DNA _dna) {
    super(origin.x, origin.y);
    this.dna = _dna.copy();
  }

  void update() {
    super.update();
    super.accelerate(this.dna.genes[time]);
    age ++;

    if( pos.x < 0 || pos.x > width ||
        pos.y < 0 || pos.y > height )
      this.stuck = true;
  }
}