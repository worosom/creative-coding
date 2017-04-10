PFont[] schriften;
int cols;
void setup() {
  //size(500, 500);
  fullScreen();

  String[] schriftenListe = PFont.list();
  schriften = new PFont[schriftenListe.length];
  for (int i = 0; i < schriftenListe.length; i++) {
    schriften[i] = createFont(schriftenListe[i], 64);
  }
  println(schriften.length);
  cols = ceil(sqrt(schriften.length));
}

void draw() {
  noLoop();
  background(0);
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < cols; j++) {
      int n = i + j * cols;
      if (n < schriften.length) {
        textFont(schriften[n]);
        textSize(height/cols);
        float x = 1.*i / cols * width, 
          y = 1.*(1+j) / cols * height;
        text(n, x, y);
      } else break;
    }
  }
}