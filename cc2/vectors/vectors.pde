PVector mouse = new PVector();
PVector mouseNormal = new PVector();
PVector fixedVec = new PVector(0, -1);
float mouseLength = 0;

void setup() {
  size(500, 500);
  strokeWeight(1/100.);
  rectMode(CENTER);
}

void draw() {
  mouse.x = mouseX - width/2;
  mouse.y = mouseY - height/2;
  //println(degrees(mouse.heading()));

  // mouse.normalize(mouseNormal);
  // speichert die Normale des Maus-Vektors
  // in die Variable "mouseNormal"
  mouse.normalize(mouseNormal);
  // mouse.mag() berechnet die Länge des Vektors
  mouseLength = mouse.mag();
  println(mouseLength);
  background(200);
  //println(mouseNormal);
  pushMatrix();
  translate(width/2, height/2);
  scale(100);
  stroke(0, 0, 255);
  line(0, 0, fixedVec.x, fixedVec.y);
  stroke(0);
  line(0, 0, mouseNormal.x, mouseNormal.y);
  line(fixedVec.x, fixedVec.y, mouseNormal.x, mouseNormal.y);
  translate(mouseNormal.x, mouseNormal.y);
  rotate(mouseNormal.heading());
  rect(0, 0, .25, .25);
  popMatrix();
  rect(0, 0, mouseLength, 25);
  // berechne die Distanz zwischen dem
  // Quadrat und dem fixen Vector
  float betweenLen = PVector.dist(mouseNormal, fixedVec);
  rect(0, 25, betweenLen*100, 25);
}