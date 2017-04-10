color rgb;
color hsv;
void setup() {
  size(500, 500);
}

void draw() {
  float time = millis() / 1000. / 10.;
  colorMode(RGB);
  for(int x = 0; x < width / 2; x++) {
    for(int y = 0; y < height; y++) {
      int red =  x;
      int green = y / 2;
      int blue = int(255*abs(sin(time)));
      color c = color(red, green, blue);
      set(x, y, c);
    }
  }
  
  colorMode(HSB);
  
    for(int x = width/2; x < width; x++) {
    for(int y = 0; y < height; y++) {
      int hue = int(255*abs(sin(time)));
      int brightness =  x - 250;
      int saturation = y / 2;
      color c = color(hue, saturation, brightness);
      set(x, y, c);
    }
  }
}