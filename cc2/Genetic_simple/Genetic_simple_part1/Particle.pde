class Particle {
  PVector pos;
  PVector vel;
  float drag = .9;
  DNA dna;
  boolean stuck = false;
  boolean arrived = false;
  
  color col;
  //Konstruktor
  Particle(int _x, int _y, color _col) {
    // initialisierung
    this.pos = new PVector(_x, _y);
    this.vel = new PVector();
    this.col = _col;
    this.dna = new DNA(lifetime);
  }

  void update() { 
    // beschleunige in die von der DNA vorgegebene Richtung
    accelerate(this.dna.genes[counter]);
    pos.add(vel);
    vel.mult(drag);
    // wenn das Partikel ausserhalb der Zeichenfläche ist,
    // setze die Position des Partikels zurück auf die Mitte.
    if(pos.x > width || pos.x < 0 ||
       pos.y > height || pos.y < 0) {
      this.stuck = true;
    }
  }
  
  void accelerate(PVector acc) {
    vel.add(acc);
  }

  void show() {
    stroke(0);
    float x1 = this.pos.x;
    float y1 = this.pos.y;
    float x2 = this.pos.x+this.vel.x;
    float y2 = this.pos.y+this.vel.y;
    line(x1, y1, x2, y2);
  }
}