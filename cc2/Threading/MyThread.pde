class MyThread extends Thread {
  boolean tick = false;

  MyThread() {
    super();
    this.start();
  }

  void run() {
    while(true) {
      this.tick =! this.tick;
      try {
        Thread.sleep(1000);
      } catch(Exception e) {
      } finally {
      }
    }
  }
}

