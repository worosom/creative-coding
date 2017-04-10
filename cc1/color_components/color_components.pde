/* Farbgenerierung und Farbkomponenten
   
   Generiert eine zufällige Farbe und stellt ihre Komponenten dar.
*/

color c = color(random(0, 255), random(0, 255), random(0, 255));

size(500, 500);
rectMode(CENTER);
noStroke();
fill(c);
rect(250, 125, 100, 100);

float red = red(c);
float green = green(c);
float blue = blue(c);

fill(red, 0, 0);
rect(125, 250, 100, 100);

fill(0, green, 0);
rect(250, 250, 100, 100);

fill(0, 0, blue);
rect(375, 250, 100, 100);

colorMode(HSB);

float h = hue(c);
float s = saturation(c);
float b = brightness(c);

fill(h, 255, 255);
rect(125, 375, 100, 100);

fill(0, 0, s);
rect(250, 375, 100, 100);

fill(0, 0, b);
rect(375, 375, 100, 100);