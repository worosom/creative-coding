MyRunnable myrunnable;
MyThread mythread;

public void settings() {
    size(500, 500);
}

void setup() {
  noStroke();
  myrunnable = new MyRunnable();
  mythread = new MyThread();
}

void draw() {
  background(200);
  if(myrunnable.tick)
    rect(0, 0, width/2, height);
  if(mythread.tick)
    rect(width/2, 0, width/2, height);
}

