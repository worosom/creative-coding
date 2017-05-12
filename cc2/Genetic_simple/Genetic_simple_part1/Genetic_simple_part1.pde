ParticleSystem ps;
int lifetime = 250;
int counter = 0;

void setup() {
  size(500, 500);
  strokeWeight(2);
  ps = new ParticleSystem(100);
}

void draw() {
  if(counter < lifetime-1) {
    counter++;
  } else {
    counter = 0;
    ps = new ParticleSystem(100);
  }
  
  //fill(200, 20);
  //rect(0, 0, width, height);
  background(200);
  ps.update();
  ps.show();
}