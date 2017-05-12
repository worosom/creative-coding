class Obstacle {
  PVector pos;
  PVector dim;
  
  Obstacle(float x, float y, float w, float h) {
    pos = new PVector(x, y);
    dim = new PVector(w, h);
  }
  
  boolean collide(PVector p) {
    if(p.x > pos.x && p.x < pos.x+dim.x) {
      if(p.y > pos.y && p.y < pos.y+dim.y) {
        return true;
      }
    }
    return false;
  }
  
  void show() {
    rect(pos.x, pos.y, dim.x, dim.y);
  }
}