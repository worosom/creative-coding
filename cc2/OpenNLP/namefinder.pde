import opennlp.tools.namefind.NameFinderME;
import opennlp.tools.namefind.TokenNameFinderModel;
import opennlp.tools.tokenize.SimpleTokenizer;
import opennlp.tools.tokenize.Tokenizer;
import opennlp.tools.util.InvalidFormatException;
import opennlp.tools.util.Span;

class NameFinder {
Tokenizer tokenizer;
NameFinderME finder;

  NameFinder() {
    // Load the model file downloaded from OpenNLP
    // http://opennlp.sourceforge.net/models-1.5/en-ner-person.bin
    try {
      TokenNameFinderModel model = new TokenNameFinderModel(new File(dataPath("")+"/en-ner-person.bin"));

      // Create a NameFinder using the model
      this.finder = new NameFinderME(model);

      this.tokenizer = SimpleTokenizer.INSTANCE;

    }
    catch(IOException e) {
      println("There has been an error reading the File");
    }
    finally {
    }
  }

  String[] findNames(String...sentences) {
    ArrayList<String> names = new ArrayList<String>();

    for (String sentence : sentences) {

      // Split the sentence into tokens
      String[] tokens = tokenizer.tokenize(sentence);

      // Find the names in the tokens and return Span objects
      Span[] nameSpans = finder.find(tokens);

      // Print the names extracted from the tokens using the Span data
      for (String s : Span.spansToStrings(nameSpans, tokens)) {
        names.add(s);
      }
    }
    return (String[]) names.toArray();
  }
}
