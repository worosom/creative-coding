// utilize the keyPressed() callback
// to append the character of the pressed key
// to the String variable 'text'

// variable to hold the typed text
String text = "";

// our font
PFont font;

float fontSize = 48;
int margin = 48;

void setup() {
  size(500, 500, P2D);
  noStroke();
  // load the font to be twice the size of what we wanna draw
  // this ensures that our font is not pixelated.
  font = createFont("Gulim.ttf", fontSize*2);
  // normally, processing draws fonts as bitmap textures (made out of pixels)
  // to override that behaviour and draw fonts as shapes made of curves, call:
  // textMode(SHAPE);
  textFont(font, fontSize);
  textAlign(LEFT, TOP);
}

void draw() {
  fill(255);
  rect(0, 0, width, height);
  fill(0);
  text(text, margin, margin, width-margin*2, height-margin*2);
}

void keyPressed() {
  // if pressed key is Backspace, clear the String
  if(key == BACKSPACE) {
    text = "";
  } else if (!(key == CODED)){
    // if pressed key is any other than
    // arrow/cmd/shift etc., append it to our text:
    text += key;
  }
}