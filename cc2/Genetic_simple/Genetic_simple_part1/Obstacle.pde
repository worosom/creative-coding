/**
 * An obstacle defines something that particles can collide with.
 * Implemented using two vectors for the position and dimension of the
 * obstacle, as well as a method to check collision by testing whether
 * a point is within the rectangle defined by the obstacle.
 */
class Obstacle {
  PVector pos;
  PVector dim;

  /**
   * Constructor defining an obstacle with specified position and dimensions.
   *
   * @param x horizontal position
   * @param y vertical position
   * @param w horizontal dimension
   * @param h vertical dimension
   */
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
