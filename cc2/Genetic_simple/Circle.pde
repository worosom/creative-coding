// Definition einer Klasse "Circle"
class Circle {
  PVector pos;
  PVector vel = new PVector();
  float drag = .85;
  boolean stuck = false;
  boolean arrived = false;

  float fitness;

  DNA dna;

  Circle(float x, float y) {
    this(x, y, new DNA(lifetime));
  }

  // Konstruktor der Klasse "Circle"
  Circle(float x, float y, DNA _dna) {
    pos = new PVector(x, y);
    this.dna = _dna;
  }
  void update() {
    this.accelerate(dna.get(counter));
    // aktualisiere die Position
    pos.add(vel);
    vel.mult(drag);
    if(pos.x < 0 || pos.x > width || pos.y < 0 || pos.y > height) {
      this.stuck = true;
    }
  }
  void accelerate(PVector acc) {
    vel.add(acc);
  }
  // Methode zum zeichnen dieser Klasse
  void show() {
    strokeWeight(2);
    line(pos.x, pos.y, pos.x + vel.x, pos.y + vel.y);
  }
}
