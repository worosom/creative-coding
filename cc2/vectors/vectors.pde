PVector mouse;
PVector mouseNormal;
PVector fixedVec;
float mouseLength = 0;

void setup() {
  size(240, 240);
  mouse = new PVector();
  mouseNormal = new PVector();
  fixedVec = new PVector(0, -1);
  //strokeWeight(1/100.);
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
  //println(mouseLength);
  background(200);
  //println(mouseNormal);
  pushMatrix();
  translate(width/2, height/2);
  //scale(100);
  stroke(0, 0, 255);
  line(0, 0, fixedVec.x*100, fixedVec.y*100);
  stroke(0);
  line(0, 0, mouseNormal.x*100, mouseNormal.y*100);
  line(fixedVec.x*100, fixedVec.y*100, mouseNormal.x*100, mouseNormal.y*100);
  translate(mouseNormal.x*100, mouseNormal.y*100);
  rotate(mouseNormal.heading());
  rect(0, 0, 25, 25);
  popMatrix();
  pushStyle();
  rectMode(CORNER);
  noStroke();
  rect(0, 0, mouseLength, 12);
  // berechne die Distanz zwischen dem
  // Quadrat und dem fixen Vector
  float betweenLen = PVector.dist(mouseNormal, fixedVec);
  rect(0, height-12, betweenLen*100, 12);
  popStyle();
}