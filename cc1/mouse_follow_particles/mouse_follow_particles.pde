// number of particles
int num = 100;
float drag = .9;
// arrays for positions and velocities
float[] x = new float[num];
float[] y = new float[num];
float[] vx = new float[num];
float[] vy = new float[num];

void setup() {
  size(500, 500);

  // for loop to initialize positions
  // to zero.
  for (int i = 0; i < num; i++) {
    // for every index 'i' counting from 0…num,
    // set the corresponding value in the positions array to 0
    x[i] = 0;
    y[i] = 0;
  }
}

void draw() {
  // draw background color
  background(255);
  // run function to update particles
  update();
  // for loop to draw the particles
  // as circles
  for (int i = 0; i < num; i++) {
    ellipse(x[i], y[i], 5, 5);
  }
}

void update() {
  // [num-1] addresses the last value in the
  // array set that to the mouse coordinate
  x[num - 1] = mouseX;
  y[num - 1] = mouseY;
  // set the velocity of the last
  // particle to that of the mouse
  vx[num - 1] = mouseX - pmouseX;
  vy[num - 1] = mouseY - pmouseY;
  // 
  for (int i = 1; i < num; i++) {
    x[i-1] = x[i];
    y[i-1] = y[i];
    vx[i-1] = vx[i];
    vy[i-1] = vy[i];
  }
  for (int i = 0; i < num; i++) {
    // add velocity to position
    x[i] += vx[i];
    y[i] += vy[i];
    // multiply position by drag
    vx[i] *= drag;
    vy[i] *= drag;
  }
}