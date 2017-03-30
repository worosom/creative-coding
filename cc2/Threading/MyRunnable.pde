class MyRunnable implements Runnable {
  Thread thread;
  boolean tick = false;

  MyRunnable() {
    this.thread = new Thread(this);
    this.thread.start();
  }

  void run() {
    while(true) {
      this.tick =! this.tick;
      try {
        Thread.sleep(500);
      } catch(Exception e) {
      } finally {
      }
    }
  }
}

