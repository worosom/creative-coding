class DNA {
  PVector[] genes;

  DNA() {
    this.genes = new PVector[lifetime];
    for(int i = 0; i < genes.length; i++) {
      this.genes[i] = PVector.random2D().mult(random(2));
    }
  }

  DNA(PVector[] _genes) {
    this.genes = _genes;
  }

  DNA crossover(DNA b) {
    PVector[] newGenes = new PVector[b.genes.length];
    float mid = random(this.genes.length);
    for(int i = 0; i < mid; i++)
      newGenes[i] = this.genes[i].copy();
    for(int i = (int)mid; i< this.genes.length; i++)
      newGenes[i] = b.genes[i].copy();
    return new DNA(newGenes);
  }

  void mutate() {
    for(int i = 0; i < this.genes.length; i++) {
      if(random(lifetime) < 10./lifetime)
        this.genes[i].add(PVector.random2D().mult(random(1)));
    }
  }

  boolean compare(DNA b) {
    float similarity = 0.;
    for(int i = 0; i < this.genes.length; i++) {
      similarity += PVector.sub(this.genes[i], b.genes[i]).mag();
    }
    similarity /= this.genes.length;
    if(abs(similarity) > .8)
      return false;
    return true;
  }

  DNA copy() {
    return new DNA(this.genes);
  }
}