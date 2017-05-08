class ParticleSystem {
  // Array für "Circle" objekte
  Circle kreis[];
  ArrayList<DNA> dnaPool = new ArrayList<DNA>();
  Obstacle box;
  Obstacle target;

  ParticleSystem(int numParticles) {
    kreis = new Circle[numParticles];
    for (int i = 0; i < kreis.length; i++) {
      // Um eine Instanz der Klasse "Circle" zu erstellen:
      color c = color(random(255), random(255), random(255));
      kreis[i] = new Circle(height/2, height - 50);
    }
    box = new Obstacle(width/4, height/2-10, width/2, 20);
    target = new Obstacle(width/2-10, 50, 20, 20);
  }

  float calcFitness(Circle a) {
    float fitness = 0;
    fitness = 1./PVector.dist(a.pos, target.pos);
    fitness *= a.stuck ? 0 : 1;
    fitness *= a.arrived ? 2 : 1;
    return fitness;
  }

  void evaluate() {
    dnaPool.clear();
    float maxFitness = 0;
    for(int i = 0; i < kreis.length; i++) {
      float fitness = kreis[i].fitness;
      if(fitness > maxFitness) {
        maxFitness = fitness;
      }
    }
    for(int i = 0; i < kreis.length; i++) {
      int num = (int)map(calcFitness(kreis[i]), 0, maxFitness, 0, kreis.length);
      for(int j = 0; j < num; j ++) {
        dnaPool.add(kreis[i].dna);
      }
    }
    println("Max Fitness:", maxFitness);
  }

  void selection() {
    for(int i = 0; i < kreis.length; i++) {
      if(dnaPool.size() > 0) {
        DNA dnaA = dnaPool.get((int)random(dnaPool.size()));
        DNA dnaB = dnaPool.get((int)random(dnaPool.size()));
        DNA childDNA = dnaA.crossover(dnaB);
        if(random(1) < .5)
          childDNA = childDNA.getMutation();
        kreis[i] = new Circle(height/2, height - 50, childDNA);
      } else {
        kreis[i] = new Circle(height/2, height -50);
      }
    }
  }

  void update() {
    for (int i = 0; i < kreis.length; i++) {
      if(!kreis[i].stuck && !kreis[i].arrived) {
        if(kreis[i].fitness < calcFitness(kreis[i])) {
          kreis[i].fitness = calcFitness(kreis[i]);
        }
          kreis[i].update();
        if(box.collide(kreis[i].pos)) {
          kreis[i].stuck = true;
        }
        if(target.collide(kreis[i].pos)) {
          kreis[i].arrived = true;
        }
      }
    }
  }

  void show() {
    box.show();
    target.show();
    update();
    for (int i = 0; i < kreis.length; i++) {
      kreis[i].show();
    }
  }
}
