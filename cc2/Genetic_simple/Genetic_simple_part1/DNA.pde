/**
 * DNA class for encapsulating an array containing
 * the Vectors that define the movement of a particle.
 */
class DNA {
  PVector[] genes;

  /**
   * Constructor defining DNA with random vectors for genes.
   *
   * @param len  length of the array, equal to the lifetime of a particle.
   */
  DNA(int len) {
    // initialisiere das array zum speichern der Gene
    this.genes = new PVector[len];
    // fülle das Array mit zufälligen Vektoren
    for(int i = 0; i < len; i++) {
      this.genes[i] = PVector.random2D();
    }
  }
}
