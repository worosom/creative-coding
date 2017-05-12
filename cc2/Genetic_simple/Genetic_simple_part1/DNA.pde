class DNA {
  PVector[] genes;
  
  DNA(int len) {
    // initialisiere das array zum speichern der Gene
    this.genes = new PVector[len];
    // fülle das Array mit zufälligen Vektoren
    for(int i = 0; i < len; i++) {
      this.genes[i] = PVector.random2D();
    }
  }
}