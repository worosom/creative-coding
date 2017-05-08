interface Showable {
  void show();
}

interface Collider extends Showable {
  boolean collide(PVector p);
}

class Target implements Collider {
  PVector pos;
  float size;

  Target(float x, float y, float _size) {
    this.pos = new PVector(x, y);
    this.size = _size;
  }

  boolean collide(PVector p) {
    if(PVector.dist(this.pos, p) < size / 2)
      return true;
    else
      return false;
  }

  void show() {
    ellipse(pos.x, pos.y, size, size);
  }
}

class Block implements Collider {
  PVector pos;
  PVector dim;

  Block(float x, float y, float w, float h) {
    this(new PVector(x, y), new PVector(w, h));
  }

  Block(PVector _pos, PVector _dim) {
    this.pos = _pos.copy();
    this.dim = _dim.copy();
  }

  boolean collide(PVector p) {
    if(p.x > this.pos.x && p.x < this.pos.x + this.dim.x)
      if(p.y > this.pos.y && p.y < this.pos.y + this.dim.y)
        return true;
    return false;
  }

  void show() {
    rect(pos.x, pos.y, dim.x, dim.y);
  }
}