class DNA {
  PVector genes[];

  DNA(int len) {
    genes = new PVector[len];
    for(int i = 0; i < genes.length; i++) {
      genes[i] = PVector.random2D().setMag(random(3));
    }
  }

  DNA(PVector[] newGenes) {
    genes = newGenes;
  }

  PVector get(int i) {
    return genes[i];
  }

  DNA crossover(DNA other) {
    int mid = genes.length/2;
    PVector newGenes[] = new PVector[genes.length];
    for(int i = 0; i < newGenes.length; i++) {
      if(i < mid) {
        newGenes[i] = this.genes[i].copy();
      } else {
        newGenes[i] = other.genes[i].copy();
      }
    }
    return new DNA(newGenes);
  }

  DNA getMutation() {
    PVector[] mutant = new PVector[genes.length];
    for(int i = 0; i < genes.length; i++) {
      if(random(100) < 10) {
        mutant[i] = PVector.random2D().setMag(random(3));
      }
      else {
        mutant[i] = genes[i].copy();
      }
    }
    return new DNA(mutant);
  }
}
