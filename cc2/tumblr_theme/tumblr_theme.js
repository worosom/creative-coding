var two;
function setup() {
  var canvas = createCanvas(80, 80, WEBGL);
  canvas.parent('title-sketch');
  two = loadModel("https://raw.githubusercontent.com/worosom/creative-coding/master/cc2/assets/2.obj");
}

function draw() {
  var dirX = (mouseX / windowWidth)-.5;
  var dirY = (mouseY / windowHeight)-.5;
  translate(0, 0, -66);
  rotateX(PI);
  rotateX(dirX*TWO_PI);
  rotateY(dirY*TWO_PI);
  model(two);
}