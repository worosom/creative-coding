class Circle {
  PVector pos;
  PVector vel;
  float drag = .9;
  
  color col;
  //Konstruktor
  Circle(int _x, int _y, color _col) {
    // initialisierung
    this.pos = new PVector(_x, _y);
    this.vel = new PVector();
    this.col = _col;
  }

  void update() { 
    // lineare interpolation in die richtung der Maus
    // pos.lerp(mouse, random(.1));
    accelerate(PVector.random2D());
    pos.add(vel);
    vel.mult(drag);
    // wenn das Partikel ausserhalb der Zeichenfläche ist,
    // setze die Position des Partikels zurück auf die Mitte.
    if(pos.x > width || pos.x < 0 ||
       pos.y > height || pos.y < 0) {
      pos.x = width/2;
      pos.y = height/2;
    }
  }
  
  void accelerate(PVector acc) {
    vel.add(acc);
  }

  void show() {
    this.update();
    fill(this.col);
    ellipse(this.pos.x, this.pos.y, 20, 20);
  }
}