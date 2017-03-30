NameFinder nf;
String[] sentences = {
  "If President John F. Kennedy, after visiting France in 1961 with his immensely popular wife,"
  + " famously described himself as 'the man who had accompanied Jacqueline Kennedy to Paris,'"
  + " Mr. Hollande has been most conspicuous on this state visit for traveling alone.",
  "Mr. Draghi spoke on the first day of an economic policy conference here organized by"
  + " the E.C.B. as a sort of counterpart to the annual symposium held in Jackson"
  + " Hole, Wyo., by the Federal Reserve Bank of Kansas City. " };

void setup() {
  nf = new NameFinder();
  for(String name : nf.findNames(sentences)){
    println(name);
  }
}

void draw() {
}
