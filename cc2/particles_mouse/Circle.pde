// Definition einer Klasse "Circle"
class Circle {
  float radius;
  PVector pos = new PVector();
  PVector vel = new PVector();
  float drag = .85;
  color col;
  // Konstruktor der Klasse "Circle"
  Circle(float _radius, color _col) {
    this.radius = _radius;
    this.col = _col;
  }
  void update() {
    PVector mouseDir = PVector.sub(mouse, this.pos);
    mouseDir.mult(brightness(this.col)/255.*.025);
    this.accelerate(mouseDir);
    this.accelerate(PVector.random2D());
    // aktualisiere die Position
    pos.add(vel);
    vel.mult(drag);
  }
  void accelerate(PVector acc) {
    vel.add(acc);
  }
  // Methode zum zeichnen dieser Klasse
  void show() {
    this.update();
    fill(this.col);
    ellipse(pos.x, pos.y, radius, radius);
  }
}